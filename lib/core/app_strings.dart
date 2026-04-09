class AppStrings {
  static String cancel(bool isEnglish) => isEnglish ? "Cancel" : "বাতিল";
  static String ok(bool isEnglish) => "OK";
  static String limitReached(bool isEnglish) => isEnglish ? "Limit Reached" : "সীমা অতিক্রম করেছেন";
  static String limitMessage(bool isEnglish) => isEnglish
      ? "You've used your 5 free detections. Please login for unlimited access."
      : "আপনি ৫টি ফ্রি ট্রায়াল ব্যবহার করেছেন। আনলিমিটেড ব্যবহারের জন্য লগইন করুন।";
  static String loginOrRegister(bool isEnglish) => isEnglish ? "Login / Register" : "লগইন / রেজিস্টার";
}
