import * as functions from "firebase-functions";
// import * as _ from "lodash";
// import admin = require("firebase-admin");
// import * as admin from ("firebase-admin");

// eslint-disable-next-line @typescript-eslint/no-var-requires
const admin = require("firebase-admin");
admin.initializeApp(functions.config().firebase);

// eslint-disable-next-line @typescript-eslint/no-var-requires
const stripe = require("stripe")(
    // eslint-disable-next-line max-len
    "sk_test_51JOgLbGFpGPsZXGJ9GFzikexnz6XaSuNhGZkYmWA86DVHeMn4SkLdLAmvtDccbWLz0nFjK1GKzk3OrTZ2f0SejgE00cyxzBE4G" // Add your account test key
);


exports.pub_key = functions.https.onRequest(async (req, res) => {
  res.json({publishable_key: functions.config().stripe.pubkey});
});

exports.create_payment_sheet = functions.https.onRequest(async (req, res) => {
  const customers = await stripe.customers.list();
  const customer = customers.data[0];

  if (!customer) {
    res.send({
      error: "You have no customer created",
    });
  }

  try {
    const ephemeralKey = await stripe.ephemeralKeys.create(
        {customer: customer.id},
        {apiVersion: "2020-08-27"}
    );
    const paymentIntent = await stripe.paymentIntents.create({
      amount: 1111,
      currency: "usd",
      customer: customer.id,
    });
    res.json({
      paymentIntent: paymentIntent.client_secret,
      ephemeralKey: ephemeralKey.secret,
      customer: customer.id,
    });
  } catch (err) {
    res.status(400).json({
      error: {
        message: err.message,
      },
    });
  }
});

// eslint-disable-next-line max-len
exports.connected_payment_intent = functions.https.onRequest(async (req, res) => {
  const platformCustomers = await stripe.customers.list();
  const platformCustomer = platformCustomers.data[0];
  const connectedAccountId = req.query.acct;

  if (!platformCustomer) {
    res.send({
      error: "Platform has no Customers.",
    });
  }

  try {
    // should check if customer already exists on connected account
    const connectedCustomer = await stripe.customers.create({
      email: platformCustomer.email,
    }, {
      stripeAccount: connectedAccountId,
    });
    const ephemeralKey = await stripe.ephemeralKeys.create(
        {customer: connectedCustomer.id},
        {
          apiVersion: "2020-08-27",
          stripeAccount: connectedAccountId,
        }
    );
    const paymentIntent = await stripe.paymentIntents.create({
      amount: 10000,
      application_fee_amount: 1000,
      currency: "eur",
      customer: connectedCustomer.id,
    }, {
      stripeAccount: connectedAccountId,
    });
    res.json({
      ephemeralKey: ephemeralKey.secret,
      paymentIntent: paymentIntent.client_secret,
      customer: connectedCustomer.id,
    });
  } catch (err) {
    res.status(400).json({
      error: {
        message: err.message,
      },
    });
  }
});


// Create a stripe customer and save it in your firabase database
exports.createStripeCustomer = functions.auth.user().onCreate(async (user) => {
  const customer = await stripe.customers.create({
    email: user.email,
    description: "My First Test Customer (created for API docs)",
  });

  console.log(customer.id);

  const stripeCustomersRef = admin.database()
      .ref(`stripe_customers/${user.uid}`);

  const customerId = customer.id;
  const userId = user.uid;

  console.log(customerId);
  console.log(userId);

  const customerData = {
    fullName: "Stripe User",
    customerId: customerId,
  };

  stripeCustomersRef.set(customerData);
});

exports.stripePayment = functions.https.onRequest(async (req, res) => {
  console.log("stripe payment intent");
  const paymentIntent = await stripe.paymentIntents.create({
    amount: 200,
    currency: "usd",
    payment_method_types: ["card"],
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  }, function(err: Error, paymentIntent: any) {
    if (err != null) {
      console.log(err);
    } else {
      res.json({
        paymentIntent: paymentIntent.client_secret,
      });
    }
  });
  return paymentIntent;
});

// Create User Payment Intent
exports.createPaymentIntent = functions.https.onCall((data, context) => {
  console.log("creating payment intent", data, context);
  return stripe.paymentIntents.create({
    amount: 1827,
    currency: "eur",
    // payment_method_types: ["card"],
  });
});

// Confirm Payment Intent
exports.confirmPaymentIntent = functions.https.onCall((data, context) => {
  console.log("confirm payment intent");
  const intentId = data.paymentIntentId;
  return stripe.paymentIntents.confirm(
      intentId,
      {payment_method: "pm_card_visa"}
  );
});
