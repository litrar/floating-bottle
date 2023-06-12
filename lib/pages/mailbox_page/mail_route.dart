import 'package:floating_bottle/pages/mailbox_page/user.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_router/go_router.dart';
import 'friend.dart';
import 'letter.dart';
import 'mailbox.dart';

Friend friend = Friend([
  User(
    "assetsfolder/friend1.jpg",
    "Ann",
    Letter("Ann", "assetsfolder/friend1.jpg",
        "It was great to hear from you. I hope this letter finds you well. I’m writing to you to catch up and let you know what’s been going on in my life. Since we last spoke, I’ve been keeping busy with work and personal projects. I’ve started a new job at a marketing agency, which has been both challenging and exciting. The team is great and I’m learning a lot every day. In my free time, I’ve been working on my photography skills and have even started a small business taking photos for local events and weddings. I’ve also been fortunate enough to do some traveling recently. Last month, I went on a trip to Japan and had an amazing time exploring the country and experiencing its culture. The food was incredible and the scenery was breathtaking. I can’t wait to plan my next adventure. How about you? What have you been up to lately? Best regards, Ann"),
    "2023/5/19",
    "20:45",
  ),
  User(
    "assetsfolder/friend2.jpg",
    "Pink",
    Letter("Pink", "assetsfolder/friend2.jpg",
        "Happy Wednesday! I hope this email finds you..."),
    "2023/5/19",
    "20:45",
  ),
  User(
    "assetsfolder/friend3.jpg",
    "HiChew",
    Letter("HiChew", "assetsfolder/friend3.jpg",
        "Thank you for your last email. Sorry for the..."),
    "2023/5/19",
    "20:45",
  ),
  User(
    "assetsfolder/friend4.jpg",
    "Emma Lin",
    Letter("Emma Lin", "assetsfolder/friend4.jpg",
        "you're so hot🥵🥵 show me....."),
    "2023/5/19",
    "20:45",
  ),
]);

final mail_route = GetPage(
  name: "/mailbox",
  page: () => MailBoxPage(friend),
  children: [],
);
