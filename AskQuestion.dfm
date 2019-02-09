object frmAskQuestion: TfrmAskQuestion
  Left = 0
  Top = 0
  BorderStyle = bsNone
  BorderWidth = 4
  ClientHeight = 394
  ClientWidth = 613
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblQuestion: TLabel
    Left = 73
    Top = 23
    Width = 420
    Height = 54
    Caption = 
      '.. .... ..... ............. ....... ............ .............. ' +
      '.................. .......................... ..................' +
      '........ ............................. ................. .......' +
      '...... .....'
    Color = clCream
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 7750410
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    WordWrap = True
  end
  object Shape1: TShape
    Left = 281
    Top = 325
    Width = 49
    Height = 43
    Brush.Color = clCream
    Shape = stCircle
  end
  object lblTimeLeft: TLabel
    Left = 293
    Top = 332
    Width = 24
    Height = 27
    Alignment = taCenter
    AutoSize = False
    Caption = '30'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object PBTimeLeft: TProgressBar
    Left = 232
    Top = 374
    Width = 150
    Height = 8
    Max = 30
    Smooth = True
    BarColor = clGreen
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = -11
    Top = 126
    Width = 642
    Height = 194
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    BevelKind = bkSoft
    BorderWidth = 2
    BorderStyle = bsSingle
    Color = 16447475
    ParentBackground = False
    TabOrder = 1
    object lblAnswer1: TLabel
      Left = 105
      Top = 11
      Width = 405
      Height = 36
      Caption = 
        '................................. ..............................' +
        '................ .............. ............ .......... '
      Color = 16447475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      WordWrap = True
    end
    object lblAnswer2: TLabel
      Left = 103
      Top = 67
      Width = 415
      Height = 36
      Caption = 
        '......................... ......................................' +
        '................... ........................................ ...' +
        '......... ........'
      Color = 16447475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      WordWrap = True
    end
    object lblAnswer3: TLabel
      Left = 103
      Top = 122
      Width = 405
      Height = 36
      Caption = 
        '................................................................' +
        '. .............. ................................... ...........' +
        '.......... ...........'
      Color = 16447475
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      WordWrap = True
    end
    object imgA1: TImage
      Left = 51
      Top = 12
      Width = 35
      Height = 35
      OnClick = imgA1Click
    end
    object imgA3: TImage
      Left = 51
      Top = 122
      Width = 35
      Height = 35
      OnClick = imgA3Click
    end
    object imgA2: TImage
      Left = 51
      Top = 67
      Width = 35
      Height = 35
      OnClick = imgA2Click
    end
    object imgNotPicked: TImage
      Left = 24
      Top = 223
      Width = 24
      Height = 25
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000009E369545874584D4C3A636F6D2E61646F6265
        2E786D7000000000003C3F787061636B657420626567696E3D22EFBBBF222069
        643D2257354D304D7043656869487A7265537A4E54637A6B633964223F3E0A3C
        783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A6D657461
        2F2220783A786D70746B3D2241646F626520584D5020436F726520342E322E32
        2D633036332035332E3335323632342C20323030382F30372F33302D31383A31
        323A31382020202020202020223E0A203C7264663A52444620786D6C6E733A72
        64663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F3232
        2D7264662D73796E7461782D6E7323223E0A20203C7264663A44657363726970
        74696F6E207264663A61626F75743D22220A20202020786D6C6E733A70686F74
        6F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F70686F746F
        73686F702F312E302F220A20202020786D6C6E733A4970746334786D70436F72
        653D22687474703A2F2F697074632E6F72672F7374642F4970746334786D7043
        6F72652F312E302F786D6C6E732F220A20202020786D6C6E733A64633D226874
        74703A2F2F7075726C2E6F72672F64632F656C656D656E74732F312E312F220A
        20202020786D6C6E733A786D705269676874733D22687474703A2F2F6E732E61
        646F62652E636F6D2F7861702F312E302F7269676874732F220A20202020786D
        6C6E733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F786170
        2F312E302F220A20202020786D6C6E733A786D704D4D3D22687474703A2F2F6E
        732E61646F62652E636F6D2F7861702F312E302F6D6D2F220A20202020786D6C
        6E733A73744576743D22687474703A2F2F6E732E61646F62652E636F6D2F7861
        702F312E302F73547970652F5265736F757263654576656E7423220A20202070
        686F746F73686F703A44617465437265617465643D22323031302D30312D3031
        220A20202070686F746F73686F703A4372656469743D227777772E67656E746C
        65666163652E636F6D220A20202070686F746F73686F703A417574686F727350
        6F736974696F6E3D22417274204469726563746F72220A202020497074633478
        6D70436F72653A496E74656C6C65637475616C47656E72653D22706963746F67
        72616D220A202020786D703A4D65746164617461446174653D22323031302D30
        312D30335432313A33323A35392B30313A3030220A202020786D704D4D3A496E
        7374616E636549443D22786D702E6969643A3136323345443245413746384445
        313138323143453442324337453336443730220A202020786D704D4D3A446F63
        756D656E7449443D22786D702E6469643A313632334544324541374638444531
        3138323143453442324337453336443730220A202020786D704D4D3A4F726967
        696E616C446F63756D656E7449443D22786D702E6469643A3136323345443245
        413746384445313138323143453442324337453336443730223E0A2020203C49
        70746334786D70436F72653A43726561746F72436F6E74616374496E666F0A20
        2020204970746334786D70436F72653A4369416472436974793D225072616775
        65220A202020204970746334786D70436F72653A436941647250636F64653D22
        3136303030220A202020204970746334786D70436F72653A4369416472437472
        793D22437A6563682052657075626C6963220A202020204970746334786D7043
        6F72653A4369456D61696C576F726B3D226B614067656E746C65666163652E63
        6F6D220A202020204970746334786D70436F72653A436955726C576F726B3D22
        7777772E67656E746C65666163652E636F6D222F3E0A2020203C64633A726967
        6874733E0A202020203C7264663A416C743E0A20202020203C7264663A6C6920
        786D6C3A6C616E673D22782D64656661756C74223E437265617469766520436F
        6D6D6F6E73204174747269627574696F6E204E6F6E2D436F6D6D65726369616C
        204E6F2044657269766174697665733C2F7264663A6C693E0A202020203C2F72
        64663A416C743E0A2020203C2F64633A7269676874733E0A2020203C64633A63
        726561746F723E0A202020203C7264663A5365713E0A20202020203C7264663A
        6C693E416C6578616E646572204B6973656C65763C2F7264663A6C693E0A2020
        20203C2F7264663A5365713E0A2020203C2F64633A63726561746F723E0A2020
        203C64633A6465736372697074696F6E3E0A202020203C7264663A416C743E0A
        20202020203C7264663A6C6920786D6C3A6C616E673D22782D64656661756C74
        223E54686973206973207468652069636F6E2066726F6D2047656E746C656661
        63652E636F6D20667265652069636F6E73207365742E203C2F7264663A6C693E
        0A202020203C2F7264663A416C743E0A2020203C2F64633A6465736372697074
        696F6E3E0A2020203C64633A7375626A6563743E0A202020203C7264663A4261
        673E0A20202020203C7264663A6C693E69636F6E3C2F7264663A6C693E0A2020
        2020203C7264663A6C693E706963746F6772616D3C2F7264663A6C693E0A2020
        20203C2F7264663A4261673E0A2020203C2F64633A7375626A6563743E0A2020
        203C64633A7469746C653E0A202020203C7264663A416C743E0A20202020203C
        7264663A6C6920786D6C3A6C616E673D22782D64656661756C74223E67656E74
        6C65666163652E636F6D20667265652069636F6E207365743C2F7264663A6C69
        3E0A202020203C2F7264663A416C743E0A2020203C2F64633A7469746C653E0A
        2020203C786D705269676874733A55736167655465726D733E0A202020203C72
        64663A416C743E0A20202020203C7264663A6C6920786D6C3A6C616E673D2278
        2D64656661756C74223E437265617469766520436F6D6D6F6E73204174747269
        627574696F6E204E6F6E2D436F6D6D65726369616C204E6F2044657269766174
        697665733C2F7264663A6C693E0A202020203C2F7264663A416C743E0A202020
        3C2F786D705269676874733A55736167655465726D733E0A2020203C786D704D
        4D3A486973746F72793E0A202020203C7264663A5365713E0A20202020203C72
        64663A6C690A20202020202073744576743A616374696F6E3D22736176656422
        0A20202020202073744576743A696E7374616E636549443D22786D702E696964
        3A31363233454432454137463844453131383231434534423243374533364437
        30220A20202020202073744576743A7768656E3D22323031302D30312D303354
        32313A33323A35392B30313A3030220A20202020202073744576743A6368616E
        6765643D222F6D65746164617461222F3E0A202020203C2F7264663A5365713E
        0A2020203C2F786D704D4D3A486973746F72793E0A20203C2F7264663A446573
        6372697074696F6E3E0A203C2F7264663A5244463E0A3C2F783A786D706D6574
        613E0A3C3F787061636B657420656E643D2272223F3EE61FA9C4000000097048
        597300000B1300000B1301009A9C1800000A4F6943435050686F746F73686F70
        204943432070726F66696C65000078DA9D53675453E9163DF7DEF4424B888094
        4B6F5215082052428B801491262A2109104A8821A1D91551C1114545041BC8A0
        88038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE17BA36BD6BCF7E6
        CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E11E083C7C4C6E1
        E42E40810A2470001008B3642173FD230100F87E3C3C2B22C007BE000178D30B
        0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08801400407A8E42
        A600404601809D98265300A0040060CB6362E300502D0060277FE6D300809DF8
        997B01005B94211501A09100201365884400683B00ACCF568A45005830001466
        4BC43900D82D00304957664800B0B700C0CE100BB200080C0030518885290004
        7B0060C8232378008499001446F2573CF12BAE10E72A00007899B23CB9243945
        815B082D710757572E1E28CE49172B14366102619A402EC27999193281340FE0
        F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEABF06FF226262E3
        FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225EE04685E0BA075
        F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5E4E4D84AC4425B
        61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D814704F8E0C2CC
        F44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9582A14E3511271
        8E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF3500B06A3E017B91
        2DA85D6303F64B27105874C0E2F70000F2BB6FC1D4280803806883E1CF77FFEF
        3FFD47A02500806649927100005E44242E54CAB33FC708000044A0812AB0411B
        F4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64801C726029AC82
        422886CDB01D2A602FD4401D34C051688693700E2EC255B80E3D700FFA61089E
        C128BC81090441C808136121DA8801628A58238E08179985F821C14804128B24
        20C9881451224B91354831528A542055481DF23D720239875C46BA913BC80032
        82FC86BC47319481B2513DD40CB543B9A8371A8446A20BD06474319A8F16A09B
        D072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C46C302EC6C342B1
        382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704128145C0093604
        774220611E4148584C584ED848A8201C243411DA093709038451C2272293A84B
        B426BA11F9C4186232318758482C23D6128F132F107B8843C437241289433227
        B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9DA646BB2073994
        2C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853E22852CA6A4A19
        E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1B652AF5187A813
        34759A39CD8316494BA5ADA295D31A681768F769AFE874BA11DD951E4E97D057
        D2CBE947E897E803F4770C0D861583C7886728199B18071867197718AF984CA6
        19D38B19C754303731EB98E7990F996F55582AB62A7C1591CA0A954A9526951B
        2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353E3A909D496AB55
        AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659C34CC34F43A451
        A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CDD97C762ABB98FD
        1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C744E09E728A797
        F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48AB51AB47EBBD36
        AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE753D953DDA70AA7
        164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E4C6FA7DE79BDE7
        FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC535716F3C1D2FC7
        DBF151435DC34043A561956197E18491B9D13CA3D5468D460F8C69C65CE324E3
        6DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B4CC7CDCCCDA2CD
        D699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B86549B2E45AA659
        EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711A7B94E934EAB9E
        D667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D6167621767B7C5AEC3EE93
        BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563ADE9ACE9CEE3F7D
        C5F496E92F6758CF10CFD833E3B613CB29C4699D539BD347671767B97383F388
        8B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F59D9BB39BC2EDA8
        DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5D13F0B9F95306B
        DFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761EF173EF63E729F
        E33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF437F23FF64FF7AFF
        D100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65F6B2D9ED418CA0
        B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE690E85507EE8D6D0
        0761E6618BC37E0C2785878557863F8E7088581AD131973577D1DC4373DF44FA
        449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3FC62E6659CCD558
        9D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B17982FC85D7079
        A1CEC2F485A716A92E122C3A96404C884E3894F041102AA8168C25F21377258E
        0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC91BC357924C533
        A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD31839291907142
        AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507C96BB390AC0559
        2D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E2BCDEDCCB3CADB
        90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39B23C7179DB0AE3
        15052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D6B815EC1CA82C1
        B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D1B3E15898AAE14
        DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF66D266E9E6DE2D
        9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97CD28DBBB83B643
        B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB561D7F86ED1EE1B
        7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49FBB3F73FAE89AA
        E9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51DD23D54528FD62B
        EB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9F709DFF71E0D3A
        DA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B625BBA4FCC3ED1
        D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367F2CF8C9D959D7D
        7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8BE73BBC3BCE5CF2
        B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB9CBB9AAEB95C6B
        B9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393DDDBDF37A6FF7C5
        F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41D943DD87D53F5B
        FEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43058F998FCB860D
        86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECBAE17162F7EF8D5
        EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C61EBEC97833315E
        F456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553D0A7FB93199393
        FF040398F3FC63332DDB000002934944415478DAC597796EDA4014C6ED208158
        1420EC61B113406C11202E508ED0DEA0BD418EC0117A83F606CD11D20B4410B1
        8ACD660B24EC22898204F48DA7418CDDBF2A4F78D208980FF1FDDEC396BF6177
        BB1D73CC621100CBB2D2874C26C3C14B0ED667581695BDE6B06ED0EFDFDDDD89
        6843F27E0748A7D329D8BBA560FC2F906C3E9F2FEC0152A914EA3C0F20B4CD99
        BF9D238874A1501025806432F90336BE7E84F941FDBCBFBFFF26015C5D5DCD18
        E5E86F6022DF55EAF89AC1D7D561CD8BC5A25502482412F25BE1A65C2E7F51B3
        DD783CFE4B0E512A95580920168BC901B2D56AF5B79A00D168F413832FF27D55
        2A150C1089440800183D5FABD5443501C083032FE1700F3C3040381C26001A8D
        06ABA6F97B854221C2A75EAF6300B9D06C36A90004834145A312C0E5E52521B4
        DB6D2A00171717844FABD5C2003CCF1382288A5400388E237C0441C00072A1D3
        E950010804028A462500BFDF4F08BD5E8F0A80CFE7237CBADD2E06F07ABD8430
        180CA8009C9F9F133EFD7E1F03C8858787072A001E8F47D1A804E076BB096134
        1A510170B95C84CF7038C4004EA793109E9E9EA800381C0EC2E7F1F11103D8ED
        7642984C2654006C361BE1331E8F31805C984EA75400CECECE148D4A0056AB95
        10E6F33915008BC542F8CC66330C60369B0961B95C5201383D3D257C168B0506
        900BB0C7AF562B551FC726938983C7BC206F5402005111489E9F9F550D2446A3
        511148A0490C6030181491ECF5F555D548A6D7EB1591ECE5E5050380A808A5B0
        8F0E1128940A6F6F6FFFF577E8743A14F77958D7307E452885267128852F1E25
        96436338966BB55A94D7F20CFD53D1BE7B98487ABD5E8BFBA39946A349C1FBDB
        0F8040E6D9CD665320CE86A84E4E4ED024720CC5C32978E5B6DB2D79383D66FD
        0140336CD08884B0EB0000000049454E44AE426082}
      Visible = False
    end
    object imgCorrect: TImage
      Left = 42
      Top = 246
      Width = 25
      Height = 25
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF40000000473424954080808087C0864880000047549
        44415478DAED957F6C535514C7CF7DF7FDE86BBBB61BDDBA65CC349B328201A7
        664AD001010C4E4674711990A9A82010E34C30F307FED87462420C23A0C16096
        11C5FD81736148C4C5A06622111630338B224ED8449C215BB6AED4BEF7DABE77
        AFA70AC3C1C65664E50F3DCDEBCD7DBDF79CCF3DE77B4F095C6723FF4980753F
        BB00384B274082D70BC083001B80437DD201D676A5D831F04B84C0229C2E4B3A
        C09A1F539647CFB14D720A392A48E4B1A401ACEE74521C666A036CBFA9F10CB7
        9FAE1545B2336900ABBE73E45931F2565FA759ECCE117EB767D2790DB342A792
        02F068BB232BA6F35DC15FD84242C1F2F869DD0745E117E2BF4D3AC023871CE9
        8CF1EAD06F7C8DD6CFE5B469E4A4E21656EE9A13FE6652012ABE70E2377761F0
        EDFA007F501BE0AACD43986BAAF02C08F04E6351D89854801507EC2EBC6A4FEA
        83FC353D0092801274F8C8AFB2130A09A5FD8D7343306900E5FBED5ECEF91653
        8765912190E3EF140FF4E3D57BE6C37BB5C67FAEBDE600651FDB337178D134F8
        6ACB001BB78008127039059A04119E6E2AD1FB460528FD485570B809BBD4297C
        ADB7946B09052E6D52297ACB2584BCCD4C988F8F82BEE2113895F9492A91079A
        4BB5E397EEBB08B05BCDC1D936DCD482D3A696E57A242180DDB6BB81901A0E64
        016728B361E31A11A05AA4644B7399C6C70458DAA8FA70A847B1CC6516D461EA
        EA3E59A98F9B86A5EFAB5E0CB702D35B2B88C48DC21BF6897EB81563DBF15DF5
        BE0A2330DAFEE1C525EFD9EC88F7BA6C27EBF104016C1C0D38367CBACAF869B4
        8D4B1A5409877C6C2C35548179A242BC2383731ED3E13466742166A067DF433A
        BF2240F14E1B8005774A2A69535C44B1629CC534DECBA2D08CF53C8830DDB82C
        7E77ED20703FD6B48CCAE41EC9093E2AA21B7251CFDCE26004598F694055EB13
        C69E2B6570C42DB8EF5D9572C25B9DE9E202D10E94990C6206675604CE59517E
        16531AC612A550193210D44D15941C25973813401FB29811606FE07C53EB3A43
        9B3040DC166D530A1455DC91E94FBD43B07112B134B0780CF05E8FED044FAF50
        07C8820A81BE2133D867ECE1263CFE59A5111E4F4397036C5544E0A438CDEBA9
        CFF6FB7C585F8832030C2B04311601330E030CCE5F311089044E3115ECA21BFE
        0887A0FB87DEA36694557EBE3ED23E5EF05101FE82D8AC1281D00AEF94F457F3
        6FBE3157B64978488E99B0F08902434170FCC43547B1CB8844866028C04F1CEF
        1A08F687EFC7841CF9F2F908BB6A80B8CDDFA8A882202EF6E7E4354C9F312DD5
        E1B29D5F7B79294C54E9B18EF6D0999EB35B715AD3B6C118BB5E1305B8604535
        4AA12F2DBBA6E096DB1667E7648B922C8E0C6EC5A0E3FB76B3E358C7664CCCC6
        AF6BA3E3D63D2180BB5E9151F834778AC757959D95535E78FBEC5497CB85C2FB
        BBD99DE8EE64870EB77D15181C7C9852A1F7606D420D74E27F46B39F93B151C0
        1C9F37F3E519F9B30A664EBFD513DFDFB8B7FE486020F0D4E13723DF26143951
        8061902AE90651929664654CAD4465E69E3ED3538A5E0EB46F8E9A4901B86079
        25824C45B077ED654357EBE35F015C2BFB1FE04FB8AEB5116D9E2E8900000000
        49454E44AE426082}
      Visible = False
    end
    object imgIncorrect: TImage
      Left = 62
      Top = 268
      Width = 24
      Height = 24
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF4000009184944415478DAC5577B6C53D719FFDDEB47
        6CC771ECD8891D3B714C5E24342960A03042C323197D686DD756ABAAADA3ADE8
        B4A9682A6C95D64D6852B56A43DAA4698F569AD6751D0CD8445BA06B7888F21C
        9084244D20A13489435E769E76E23C1DBFF79DEBE3624254FADFAEF4C9BEF79E
        73BEDFF7FB7EDF77CE15E2F138FE9F9720136488C6A3C8A09B356456B27C320B
        5916998E4C4B9626000C6A806C96FE4CD1AF999EC5D82264E96472B28578E257
        9BAE44EB5C48E706A6FBE9DE43F619D9241B2B57D262719A1BBF17402E5B98EC
        A5977F14D78AD1C0677FFBAB2693EED56471E13E00E289F732B6CED62DF562D5
        F60DFF78EB173A723EC300B4DE0F80932C9BAC0C98F855E78021367C1B47B76C
        7169809274243CDD0FC03CFD7A818F37BFFEFA13B9CFBC80BD1B57A10F308D02
        BEB6AF02C0687E1010A3407447D90ABC7AEB2610061A562E47DFADAE214A894D
        6429109606A0A567ECFD1070C6F84045ED370F7E00A8D438F2E31FE277674E81
        5C9674002EFF6200224D677F141400511D7E6DD51AECDDF373E26022B1749103
        0DBFFC293C6D3782265A728131804500E2090628F27673456545F5DE5F032314
        732804E4E5E1F0A1BFE3B54F8EB27925C4A04B2D53D2CA09F10B29828CEF2C5F
        81775FD90D0C0E603E308B582C0E55860EF2B54EB4FE691FBAEB1B03942ACD7C
        12001200D845CF9AF357AF59B371E72E447AFB109C9B9390A52BD200C732FCFE
        E431FCE4CC0936D4281764130A4180C08C1E281FD259FD4F576F56BF51B61CE8
        1FC0742C4269E1E54923544A15D40F94A3F1D05FD0F77967373D2A9DE100A289
        C88F2F2B2E7D72DBB3DFC382DB83407041A29805C99CE8647288D65CBC79E532
        0E36B7A03B3E5BA01464030A91F85FADCFFDF37BBF7967D7AAE7BF05ECD90D6F
        6B0BA26A8DA4F8044109201AA512BA8265B876F9137C7E7BB0935C94E5EBF5F0
        F8FD1FE617143EF3D8A65A92BA0773A160C279B2CE693EB987912D55B21C75E6
        427C70F6E3C6F75B2E6E90DE170ACA6C87A0BB3494A32DBBB8A90A394DD7E061
        02512808C49D0CC5E899962231DAF3D1D2DD8661AFEFDC4230D29365CAFE414D
        F96AF83C43988D86A488EF388704268F4C309BE1BCD581E84C64365F6FD85AE7
        EB6B96C6942B33D0199AD1512ECF8B692AE7F496ED486FAE4777600E02536B2A
        0832553004F3B222C4DF7D0F21FF14143B5F84776E0A01512E55C15D573C86DC
        6814E9563B2AC747D1E1F78D53B5D592186F7C09B252AD476FC0CF14CA9A5E43
        8946537E75D57A68EACF53AE125D2DF50AF3CE58FCFD57A8527CE8AA3B2AF586
        C5E3581272C8324D26D484A3B83235C964F330D9F53B8925000F6AF4E89FF74B
        AAA636ECA097E70BB53AC7718B0553AE2E74A52C9E9CC898307201B2BA1653CA
        29CE8DB571872603AFCA643837E30F53993E36089C8DF04E19E3E324007D0460
        9AEF01A46C1355EFE9626D86F3ED6C0B5CBDDD521F572C72922CBFC5CE990303
        5951BA0EBF25955F9EF18F93F32728C0C61ECEE05D00CA790A16F806644D2CA0
        A501172B33329D7BF406DC1AECC338DF0FEEC9738A73C6888639D768B15F94A1
        7976CA47C0375347B8C9E6BB38403125002187008C05FCD28D8ACCCEEB9B2854
        D162A76BB373AABFB361235CA74EE08B70488A36B57B89298CB09CE7EB8D3817
        0DA37166FA36E9EA7172DEC956A7BE889E25800BB7ACF9F00E0DB21E2EA10B72
        9AD8163A4656B5AC38FE52533BF0C273F8D7A9FF608EA72335F208FFDD94A682
        F58D3771A2EE381A9BAF56EA818E8B89468561FE7B0F808B963CF846DCD200F0
        C51895830947876BACB6E7CBA82B750CBBD1C905A95C024090E77E6D8E05634A
        05CEBB07AF5320ABF239B32C7D699C3179CA3CE1B4C586C9110F4652F2C818A0
        488F6DB0E63F655B08A079C28B10CFAF9C8B084B800870761ECACE818B1A59CB
        90A78B04B85CC99D27AB494C99279C5A04804542823C5E95677FD2BE1042AB77
        4402A4E68E93CE63DCE429F7D11410CE9C5CF42944D47B3CDD34A654BD0400A4
        02486A804034ADB7E5ADCDA38ED7EE1D93165571C7722E4006881D5C5843EA4D
        5938C28104B8930AB3051E851C4D6E37DBC133947C7E3205128093661B26463D
        702772DBBED16EAFC89C9D47E74442326A9E7391838870C7CEF59BA8DE8AE13A
        F4BED427E4292C843993EC5A6ECAC1844A8106B72748CF5572DCDD35853AA319
        E3BE5126C2B3D5D6DC6DA640103D931312C2A473790A6D8C8DCA2C23E6BEFD14
        425926188E1C464FFF207C3CBA1807C940CCF367250613C6D44A5C1D1A1AA3F7
        E6A418A5923E461D4BAE96D71595553E1E6F69427F605E7AA1E1CE1429796780
        8AAD3652396D03439E7651AD19538AA87164DBE0EEEAFE12442A0B491076831E
        4163363A077A7BFB4391C224ABC2497BF1BEDA4B977F263FF6213EDDBD4B9A9C
        C1559B546E1250BEDD8E719AD9EB1A18CD94616D9A41E71EF74E37E45A0CEBF3
        08C4787B0726525808A58060809C652B91F6E2CB68FAE8DF976F36D53F2CAD7D
        B5FAD195F19EB6360D1D9DC4A919CC10FD6A1EBD9247CF00990A0A289732F476
        DEF69183CD7AA57833CD9049FA99D410E8FF1A2DD94E07F594405BABD4F59200
        16B828359436105D61DAA267159AEF5E770F1E96F697AB55B5F05FF9B482DA65
        6399395B93234BC3D4905B8A9E0D60BB9AB6A4143E318C91CEDE71D2C6B608F5
        2576E83159B2A88226D89121834473416334388B1C4508B5344B20920C1872F3
        3029C6D04987168AFA59D2DB47C9EF07A1BEFA114C5D3ACD1ACF3A8AF45AA12D
        1BC6981CD3C3C3D2969B4E074A4F248829F7505426A02A26A031C8F75C230740
        9B1E947198227134A565E91C4545A50834354B1B582655D9649A08D7C0206363
        07ED8A0716128D2EA181862D8F62E4C22949647422A9A5C8CFD84C3AD8AD2510
        6C364CF7DE80F78BBE99A888A7C1F673124430B60400B6A000071D804EA49BB3
        CAF38C16C4C7BC185653DA068799B67691D37726795AE69255900AC09010DE3A
        12DC85B2FDFB35B2D21518DDB0D64B346E8FC9D01A4DF6FDA500D06AC4108418
        74B1182E18AAD6ADD63FFC08BAF7BDC5CE1A3B68DE81297AEFE79F6F5F0500F4
        01529159B3B55D4EB99BFEE781D5E4AF8DB24247F5AF01801DE3E84B4FF58D35
        EDAA759B0AC6FEF887E788F6234C0B4B02682400C34900EC1B209E386EE98A1C
        35B17058BE30E039CD4646655F1F8082A8926769CB655946A7CFD57F90956150
        487CCC2C06F03FF477D17DAD85E3FD0000000049454E44AE426082}
      Visible = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 672
    Top = 424
  end
  object PopupMenu1: TPopupMenu
    Left = 744
    Top = 648
  end
end
