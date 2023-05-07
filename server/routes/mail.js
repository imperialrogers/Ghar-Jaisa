const express = require("express");
const Mailgen = require('mailgen');
const admin = require('../middlewares/admin.js');
const nodemailer = require("nodemailer");

const mailRouter = express.Router();


//REAL ACCOUNT


//_____________________________________WELCOME MAIL________________________________

    mailRouter.get("/mail/welcome", async (req, res) => {
    let config  = {
        service : "Hotmail",
        auth : {
            user: 'food-delivery-subsystem@hotmail.com',
            pass: 'guhnbpnhvqhnvtit'
        }
    }

    let transporter = nodemailer.createTransport(config);
    let mailGenerator = new Mailgen({
        theme: {
            palette: {
              primary: "#FF595E",
              secondary: "#FFCA3A",
              tertiary: "#222222",
              quaternary: "#F5F5F5"
            },
            typography: {
              fontFamily: "Montserrat, sans-serif",
              fontSize: "16px",
              fontWeight: "bold"
            }
          },
        product: {
          name: "Food Delivery App",
          link: "https://www.ourwebsite.com/",
    logo: "https://previews.123rf.com/images/butenkov/butenkov2004/butenkov200400033/143760140-vector-logo-of-food-delivery.jpg"
        }
      });

      let email = {
        body: {
          name: "Foodie",
          intro: "Thank you for choosing Food Delivery Company! We're excited to bring delicious meals right to your doorstep. Here's what you can expect from our service:",
          table: {
            data: [
              {
                icon: "🍽️",
                title: "Wide Selection of Restaurants",
                description: "Easily browse and order from our wide selection of restaurants online."
              },
              {
                icon: "🚚",
                title: "Fast and Reliable Delivery",
                description: "Our friendly drivers will deliver your meals quickly and reliably."
              },
              {
                icon: "💳",
                title: "Flexible Payment Options",
                description: "Pay for your meals with cash, credit card, or PayPal."
              },
              {
                icon: "🎁",
                title: "Exclusive Discounts",
                description: "Save money with exclusive discounts and promotions for our loyal customers."
              }
            ],
            columns: {
              // Optionally, customize the column widths
              customWidth: {
                icon: "10%",
                title: "30%",
                description: "60%"
              },
              // Optionally, customize the table colors
              colors: {
                headerBg: "#FF595E",
                headerColor: "#FFFFFF",
                border: "#FFCA3A"
              }
            }
          },
          action: {
            instructions: "To get started, please click the button below:",
            button: {
              color: "#FFCA3A",
              text: "Browse Restaurants",
              link: "https://www.fooddeliverycompany.com/restaurants"
            }
          },
          text: "We're committed to providing you with the best possible service. If you have any questions or concerns, please don't hesitate to contact us. Enjoy your meal!\n\nThe Team at Food Delivery Company",
          signature: "The Team at Food Delivery Company",
          social: {
            title: "Follow us on social media!",
            links: [
              {
                icon: "https://cdn3.iconfinder.com/data/icons/picons-social/57/43-twitter-512.png",
                link: "https://twitter.com/fooddeliveryco"
              },
              {
                icon: "https://cdn3.iconfinder.com/data/icons/picons-social/57/38-instagram-512.png",
                link: "https://www.instagram.com/fooddeliveryco/"
              },
              {
                icon: "https://cdn3.iconfinder.com/data/icons/picons-social/57/39-facebook-512.png",
                link: "https://www.facebook.com/fooddeliveryco/"
              }
            ]
          },
          unsubscribe: {
            text: "To stop receiving these emails, please click here:",
            link: "https://www.fooddeliverycompany.com/unsubscribe"
          }
        }
      };
      
      
      let mailBody = mailGenerator.generate(email);
      let message = {
        from: '"Food Delivery Subsystem" <food-delivery-subsystem@hotmail.com>', // sender address
    to: "www.chintanchawda5445@gmail.com, 21bds013@iiitdwd.ac.in", // list of receivers
    subject: "Welcome to Food Delivery App !", // Subject line
    html: mailBody,
    text: mailGenerator.generatePlaintext(email)
      };

      await transporter.sendMail(message, function(error, info) {
        if (error) {
          console.log(error);
        } else {
          console.log("Email sent: " + info.response);
        }
      });

        res.json();
        
    });


    //______________________________________UPDATE PASSWORD MAIL__________________________________

    mailRouter.get("/mail/updated-password", async (req, res) => {
      let config  = {
          service : "Hotmail",
          auth : {
              user: 'food-delivery-subsystem@hotmail.com',
              pass: 'guhnbpnhvqhnvtit'
          }
      }
  
      let transporter = nodemailer.createTransport(config);
      let mailGenerator = new Mailgen({
          theme: {
              palette: {
                primary: "#FF595E",
                secondary: "#FFCA3A",
                tertiary: "#222222",
                quaternary: "#F5F5F5"
              },
              typography: {
                fontFamily: "Montserrat, sans-serif",
                fontSize: "16px",
                fontWeight: "bold"
              }
            },
          product: {
            name: "Food Delivery App",
            link: "https://www.ourwebsite.com/",
      logo: "https://previews.123rf.com/images/butenkov/butenkov2004/butenkov200400033/143760140-vector-logo-of-food-delivery.jpg"
          }
        });
  
        const email = {
          body:{
          name: "John",
    intro: "Your password has been successfully updated!",
    table: {
      data: [
        {
          icon: "🔑",
          title: "Password Updated",
          description: "Your password has been updated successfully."
        },
        {
          icon: "📧",
          title: "Account Security",
          description: "For security reasons, we recommend changing your password frequently."
        },
      ],
      columns: {
        // Optionally, customize the column widths
        customWidth: {
          icon: "10%",
          title: "30%",
          description: "60%"
        },
        // Optionally, customize the table colors
        colors: {
          headerBg: "#e53935",
          headerColor: "#ffffff",
          border: "#cccccc"
        }
      }
    },
    action: {
      instructions: "If you did not change your password, please contact us immediately.",
      button: {
        color: "#e53935",
        text: "Contact Us",
        link: "https://myapp.com/contact"
      }
    },
    text: "If you have any questions or concerns about your account, please don't hesitate to contact us.\n\nBest regards,\nThe MyApp Team",
    signature: "The MyApp Team",
    unsubscribe: {
      text: "To unsubscribe from these emails, please click here:",
      link: "https://myapp.com/unsubscribe"
    },
  } 
      };      
        
        
        let mailBody = mailGenerator.generate(email);
        let message = {
          from: '"Food Delivery Subsystem" <food-delivery-subsystem@hotmail.com>', // sender address
      to: "www.chintanchawda5445@gmail.com, 21bds013@iiitdwd.ac.in", // list of receivers
      subject: "Your MyApp Password Has Been Updated",
      html: email,
      text: mailGenerator.generatePlaintext(email)
        };
  
        await transporter.sendMail(message, function(error, info) {
          if (error) {
            console.log(error);
          } else {
            console.log("Email sent: " + info.response);
          }
        });
  
          res.json();
          
      });



      //_____________________________________UPDATED CREDENTIALS_________________________________________

      mailRouter.get("/mail/updated-credentials", async (req, res) => {
        let config  = {
            service : "Hotmail",
            auth : {
                user: 'food-delivery-subsystem@hotmail.com',
                pass: 'guhnbpnhvqhnvtit'
            }
        }
    
        let transporter = nodemailer.createTransport(config);
        let mailGenerator = new Mailgen({
            theme: {
                palette: {
                  primary: "#FF595E",
                  secondary: "#FFCA3A",
                  tertiary: "#222222",
                  quaternary: "#F5F5F5"
                },
                typography: {
                  fontFamily: "Montserrat, sans-serif",
                  fontSize: "16px",
                  fontWeight: "bold"
                }
              },
            product: {
              name: "Food Delivery App",
              link: "https://www.ourwebsite.com/",
        logo: "https://previews.123rf.com/images/butenkov/butenkov2004/butenkov200400033/143760140-vector-logo-of-food-delivery.jpg"
            }
          });
    
          const email = {
            body: {
              name: "John",
              intro: "Your profile information has been successfully updated. Here's what has changed:",
              table: {
                data: [
                  {
                    icon: "👤",
                    title: "Name",
                    description: "Your name has been updated to John Doe."
                  },
                  {
                    icon: "📧",
                    title: "Address",
                    description: "Your address has been updated"
                  },
                ],
                columns: {
                  customWidth: {
                    icon: "10%",
                    title: "30%",
                    description: "60%"
                  },
                  colors: {
                    headerBg: "#00ADEF",
                    headerColor: "#FFFFFF",
                    border: "#00ADEF"
                  }
                }
              },
              action: {
                instructions: "If you did not make these changes, please contact us immediately by clicking the button below:",
                button: {
                  color: "#00ADEF",
                  text: "Contact Us",
                  link: "https://www.example.com/contact"
                }
              },
              social: {
                title: "Connect with us on social media!",
                links: [
                  {
                    icon: "https://cdn3.iconfinder.com/data/icons/picons-social/57/43-twitter-512.png",
                    link: "https://twitter.com/example"
                  },
                  {
                    icon: "https://cdn3.iconfinder.com/data/icons/picons-social/57/38-instagram-512.png",
                    link: "https://www.instagram.com/example/"
                  },
                  {
                    icon: "https://cdn3.iconfinder.com/data/icons/picons-social/57/39-facebook-512.png",
                    link: "https://www.facebook.com/example/"
                  }
                ]
              },
              text: "Thank you for choosing our service. If you have any questions or concerns, please don't hesitate to contact us. Best regards,\nThe Example Team",
              signature: "FOOD DELIVERY TEAM",
              unsubscribe: {
                text: "To stop receiving these emails, please click here:",
                link: "https://www.example.com/unsubscribe"
              }
            }
        };      
          
          
          let mailBody = mailGenerator.generate(email);
          let message = {
            from: '"Food Delivery Subsystem" <food-delivery-subsystem@hotmail.com>', // sender address
        to: "www.chintanchawda5445@gmail.com, 21bds013@iiitdwd.ac.in", // list of receivers
        subject: "Your MyApp Password Has Been Updated",
        html: email,
        text: mailGenerator.generatePlaintext(email)
          };
    
          await transporter.sendMail(message, function(error, info) {
            if (error) {
              console.log(error);
            } else {
              console.log("Email sent: " + info.response);
            }
          });
    
            res.json();
            
        });
    
module.exports = mailRouter