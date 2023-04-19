final Map<String, List<String>> constantUserList = <String, List<String>>{
  '職業': <String>[
    '未選択',
    '学生',
    '社会人',
    'その他',
  ],
  '職種': <String>[
    '未選択',
    '営業',
    '事務',
    '販売',
    '飲食',
    'メーカー',
    '教育',
    '美容・コスメ',
    '医療',
    'ドライバー',
    '製造',
    'IT・エンジニア',
    '建築',
    '経営者・役員',
  ],
  '年齢': List.generate(71, (index) => index + 10)
      .map((e) => e.toString())
      .toList(),
};
