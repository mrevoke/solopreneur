// mail_content.dart

import 'package:flutter/material.dart';

class MailContent extends StatefulWidget {
  @override
  _MailContentState createState() => _MailContentState();
}

class _MailContentState extends State<MailContent> {
  @override
  var t=false;
  Widget build(BuildContext context) {
    return Column(
      children: [
        //networkingTitle
        Text(
          'Networking',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.05,
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        //textfield
        Container(
          width: MediaQuery.of(context).size.width * .35,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: MediaQuery.of(context).size.width * 0.002,
                color: Colors.black,
              ),
            ),
            elevation: MediaQuery.of(context).size.width * 0.008,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5 / 7,
              width: MediaQuery.of(context).size.width * 2 / 5,
              child: TextField(
                // controller: widget.emailController,
                decoration: InputDecoration(
                  hintText:
                      '  Your focus, our words – elevate your investment pitch effortlessly.',
                  hintStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      setState(() {
                        t = true;
                        //    widget.isSendIconClicked = true;
                      });
                      // Add your logic for send icon button here
                      // Set isSendIconClicked to true and update the state accordingly
                    },
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        //boxForContent
        if (t==true)
          Container(
            height: MediaQuery.of(context).size.height * 1.2 / 2,
            width: MediaQuery.of(context).size.width * .35,
            //boxForContent,
            //boxForContent
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "Dear Investor,\n\n"
                "I trust this email finds you well. My name is Bruno, and I represent [Your Company Name], a dynamic and innovative company making significant strides in [your industry/sector].\n\n"
                "I am reaching out to you because of your impressive track record in recognizing and supporting transformative ventures. We are currently at a pivotal juncture, poised for substantial growth and expansion, and we believe your strategic insight and financial support could play a crucial role in our success.\n\n"
                "Key Highlights:\n\n"
                "1. **Innovative Solutions:** [Your Company Name] is at the forefront of [mention a key innovation or product/service]. Our commitment to pushing the boundaries of what's possible has garnered attention and interest in the market.\n\n"
                "2. **Proven Performance:** With a track record of [mention any noteworthy achievements or milestones], we have demonstrated our ability to deliver results and adapt to market demands.\n\n"
                "3. **Market Potential:** Our research indicates a growing demand for [highlight a market trend/opportunity], and we are well-positioned to capitalize on this potential with the right strategic partnerships.\n\n"
                "I would welcome the opportunity to discuss our vision, strategy, and the specific investment opportunity in more detail. Could we schedule a meeting at your earliest convenience? I am confident that a partnership with [Your Company Name] could yield mutual benefits.\n\n"
                "Thank you for considering our proposal. I look forward to the possibility of working together to achieve shared success.\n\n"
                "Best regards,\n\n"
                "[Your Full Name]\n"
                "[Your Position]\n"
                "[Your Contact Information]\n"
                "[Your Company Name]",
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.002,
              ),
            ),
          ),
        if (t==false)
          Container(
            height: MediaQuery.of(context).size.height * 1.2 / 2,
            width: MediaQuery.of(context).size.width * .35,
            //boxForContent,
            //boxForContent
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(" "),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: MediaQuery.of(context).size.width * 0.002,
              ),
            ),
          ),

        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            onPressed: () {
              _showCardDialog(context);
            },
            icon: Icon(
              Icons.chat_bubble,
              size: MediaQuery.of(context).size.width * 0.03,
            ),
          ),
        ),
      ],
    );
  }

  void _showCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Card(
            child: Text('chats'),
          ),
        );
      },
    );
  }
}
