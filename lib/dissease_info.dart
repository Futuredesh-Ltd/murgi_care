// --- Disease Information Data (Refined, Precise & Bilingual) ---
final Map<String, Map<String, String>> diseaseInfo = {
  'cocci': {
    'name': 'রক্ত আমাশয় (Coccidiosis)',
    'name_en': 'Coccidiosis',
    'symptoms':
        '• মলের সাথে তাজা রক্ত বা কফি রঙের পায়খানা\n• পালক উস্কোখুস্কো ও শরীর দুর্বল\n• মুরগি দলবেঁধে ঝিমায়\n• পানি গ্রহণ কমে যায়',
    'symptoms_en':
        '• Fresh blood or coffee-colored droppings\n• Ruffled feathers and physical weakness\n• Chickens huddling or drooping together\n• Reduced water intake',
    'prevention':
        '• লিটার (বিছানা) সম্পূর্ণ শুকনো রাখা\n• খামারের আর্দ্রতা কমানো\n• কক্সিডিওস্ট্যাট যুক্ত খাবার ব্যবহার',
    'prevention_en':
        '• Keep litter (bedding) completely dry\n• Reduce farm humidity\n• Use feed containing coccidiostats',
    'treatment':
        '• চিকিৎসকের পরামর্শে টল্ট্রাজুরিল (Toltrazuril) বা এমপ্রোলিয়াম ব্যবহার\n• পানিতে ভিটামিন-কে ও স্যালাইন প্রদান',
    'treatment_en':
        '• Use Toltrazuril or Amprolium as advised by a vet\n• Provide Vitamin-K and electrolytes in water',
  },
  'ncd': {
    'name': 'রানীক্ষেত (Newcastle Disease)',
    'name_en': 'Newcastle Disease (NCD)',
    'symptoms':
        '• চুনের মতো বা সবুজাভ পাতলা পায়খানা\n• ঘাড় বাঁকা হয়ে যাওয়া বা ঘাড় মোচড়ানো (nervous sign)\n• হাঁ করে শ্বাস নেওয়া ও শব্দ করা\n• ডিমের খোসা পাতলা ও আকৃতি নষ্ট হওয়া',
    'symptoms_en':
        '• Whitish or greenish watery diarrhea\n• Twisted neck or tremors (nervous signs)\n• Gasping for air with beaks open\n• Thin-shelled or misshapen eggs',
    'prevention':
        '• সঠিক বয়সে বিসিআরডিভি (BCRDV) ও আরডিভি (RDV) টিকা প্রদান\n• খামারে জীবনিরাপত্তা জোরদার করা',
    'prevention_en':
        '• Timely BCRDV and RDV vaccinations\n• Strengthen farm biosecurity protocols',
    'treatment':
        '• ভাইরাসের কোনো চিকিৎসা নেই\n• সেকেন্ডারি ইনফেকশন রোধে এন্টিবায়োটিক ও রোগ প্রতিরোধে ভিটামিন-সি/ই ব্যবহার\n• আক্রান্ত মুরগি দ্রুত আলাদা করা',
    'treatment_en':
        '• No specific treatment (viral disease)\n• Use antibiotics for secondary infections and Vit-C/E for immunity\n• Isolate sick birds immediately',
  },
  'salmo': {
    'name': 'সালমোনেলা (Salmonella/Pullorum)',
    'name_en': 'Salmonella / Pullorum',
    'symptoms':
        '• সাদা রঙের আঠালো বা চুনা পায়খানা\n• পায়খানার রাস্তা মলে বন্ধ হয়ে যাওয়া (Vent pasting)\n• জয়েন্ট ফুলে যাওয়া ও খোঁড়ানো\n• বাচ্চার নাভি কাঁচা থাকা',
    'symptoms_en':
        '• White sticky or chalky droppings\n• Droppings sticking to the vent (Vent pasting)\n• Swollen joints and limping\n• Unhealed navels in chicks',
    'prevention':
        '• সুস্থ প্যারেন্টস স্টক থেকে বাচ্চা সংগ্রহ\n• খামার ইঁদুরমুক্ত রাখা\n• পানির পাত্র জীবাণুমুক্ত রাখা',
    'prevention_en':
        '• Source chicks from healthy parent stocks\n• Keep the farm rodent-free\n• Disinfect water containers regularly',
    'treatment':
        '• চিকিৎসকের পরামর্শে এনরোফ্লক্সাসিন বা এমোক্সিসিলিন গ্রুপ এর ওষুধ ব্যবহার\n• লিভার টনিক ও প্রোবায়োটিক প্রদান',
    'treatment_en':
        '• Use Enrofloxacin or Amoxicillin as per vet advice\n• Provide liver tonics and probiotics',
  },
  'healthy': {
    'name': 'সুস্থ মুরগি (Healthy)',
    'name_en': 'Healthy Chicken',
    'symptoms':
        '• চোখ উজ্জ্বল ও চনমনে ভাব\n• পালক মসৃণ ও সাজানো\n• স্বাভাবিক খাবার ও পানি গ্রহণ',
    'symptoms_en':
        '• Bright eyes and active behavior\n• Smooth and well-arranged feathers\n• Normal feed and water consumption',
    'prevention':
        '• নিয়মিত সুষম খাবার ও বিশুদ্ধ পানি\n• সঠিক সময়ে সব টিকা প্রদান',
    'prevention_en':
        '• Provide balanced feed and pure water\n• Complete all vaccinations on schedule',
    'treatment': '• চিকিৎসার প্রয়োজন নেই, নিয়মিত যত্ন নিন।',
    'treatment_en': '• No treatment required; maintain regular care.',
  },
  'others': {
    'name': 'সঠিক ছবি নয় (Invalid Image)',
    'name_en': 'Invalid Image',
    'symptoms': 'আপনার আপলোড করা ছবিটি মুরগির মলের (Poop) ছবি নয়।',
    'symptoms_en': 'The uploaded image is not recognized as chicken droppings.',
    'prevention': 'দয়া করে মুরগির মলের পরিষ্কার ছবি তুলে আবার চেষ্টা করুন।',
    'prevention_en':
        'Please take a clear photo of chicken droppings and try again.',
    'treatment': 'সঠিক ফলাফলের জন্য পর্যাপ্ত আলোতে ছবি তুলুন।',
    'treatment_en': 'Take photos in adequate lighting for accurate results.',
  },
};
