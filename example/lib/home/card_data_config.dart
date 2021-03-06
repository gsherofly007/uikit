

import 'dart:convert';

// import 'package:bruno/bruno.dart';
import 'package:example/components/InputText/InputTextPage.dart';
import 'package:example/components/Button/ButtonPage.dart';
import 'package:example/components/Alert/AlertPage.dart';
// import 'package:example/sample/components/actionsheet/actionsheet_entry_page.dart';
// import 'package:example/sample/components/appraise/appraise_example.dart';
// import 'package:example/sample/components/bottom_tabbar/bottom_tabbar_example.dart';
// import 'package:example/sample/components/button/bottom_button_entry_page.dart';
// import 'package:example/sample/components/button/button_entry_page.dart';
// import 'package:example/sample/components/button/button_panel_entry_page.dart';
// import 'package:example/sample/components/button/icon_button_example.dart';
// import 'package:example/sample/components/calendar/calendarview_example.dart';
// import 'package:example/sample/components/card/brn_shadow_example.dart';
// import 'package:example/sample/components/card/bubble/bubble_entry_page.dart';
// import 'package:example/sample/components/card/content/text_content_entry_page.dart';
// import 'package:example/sample/components/card_title/title_example.dart';
// import 'package:example/sample/components/charts/chart_entry_example.dart';
// import 'package:example/sample/components/charts/doughnut_chart_example.dart';
// import 'package:example/sample/components/charts/line/brn_broken_line_example.dart';
// import 'package:example/sample/components/charts/line/db_data_node_model.dart';
// import 'package:example/sample/components/charts/progress_bar_chart_example.dart';
// import 'package:example/sample/components/charts/progress_chart_entry_page.dart';
// import 'package:example/sample/components/dialog/dialog_entry_page.dart';
// import 'package:example/sample/components/empty/abnormal_entry_page.dart';
// import 'package:example/sample/components/form/all_item_style_example.dart';
// import 'package:example/sample/components/gallery/gallery_example.dart';
// import 'package:example/sample/components/guide/guide_entry_page.dart';
// import 'package:example/sample/components/input/input_example.dart';
// import 'package:example/sample/components/line/dashed_line_example.dart';
// import 'package:example/sample/components/loading/loading_widget_example.dart';
// import 'package:example/sample/components/navbar/appbar_entry_page.dart';
// import 'package:example/sample/components/noticebar/brn_notice_bar_example.dart';
// import 'package:example/sample/components/picker/picker_entry_page.dart';
// import 'package:example/sample/components/popup/popwindow_example.dart';
// import 'package:example/sample/components/rating/rating_example.dart';
// import 'package:example/sample/components/scroll_anchor/scroll_actor_tab_example.dart';
// import 'package:example/sample/components/selection/selection_entry_page.dart';
// import 'package:example/sample/components/step/step_example.dart';
// import 'package:example/sample/components/sugsearch/search_text_example.dart';
// import 'package:example/sample/components/switch/checkbox_example.dart';
// import 'package:example/sample/components/switch/radio_example.dart';
// import 'package:example/sample/components/tabbar/brn_tab_example.dart';
// import 'package:example/sample/components/tag/tag_example.dart';
// import 'package:example/sample/components/toast/toast_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// ????????????
class GroupInfo {
  /// ??????ID
  int? groupId;

  /// ?????????
  String groupName;

  /// ??????
  String desc;

  /// ????????????
  bool isExpand;

  /// ???????????????
  bool isSupportTheme;

  /// ???Widget
  List<GroupInfo>? children;

  /// ????????????????????????
  Function(BuildContext context)? navigatorPage;

  GroupInfo(
      {this.groupId,
      this.groupName = "",
      this.desc = "",
      this.isExpand = false,
      this.navigatorPage,
      this.isSupportTheme = false,
      this.children});
}

/// ???????????????
class CardDataConfig {
  /// ??????
  static List<GroupInfo> getAllGroup() {
    List<GroupInfo> list = [];
    list.add(_getInputText());
    list.add(_getButton());
    list.add(_alert());
    // list.add(_getDataInputGroup());
    // list.add(_getOperateGroup());
    // list.add(_getNavigatorGroup());
    // list.add(_getButtonGroup());
    // list.add(_getContentGroup());
    return list;
  }
  static GroupInfo _getInputText(){
      List<GroupInfo> children = [];
      children.add(GroupInfo(
          groupName: "InputText",
          desc: "???????????????",
          isSupportTheme: true,
          navigatorPage: (BuildContext context) {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return const InputTextPage("ActionSheet??????");
              },
            ));
          }));
       return GroupInfo(groupName: "????????????", children: children, isExpand: true);
  }
  static GroupInfo _getButton(){
    List<GroupInfo> children = [];
    children.add(GroupInfo(
        groupName: "Button",
        desc: "???????????????",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return  ButtonPage("???????????????");
            },
          ));
        }));
    return GroupInfo(groupName: "????????????", children: children, isExpand: true);
  }

  static GroupInfo _alert(){
    List<GroupInfo> children = [];
    children.add(GroupInfo(
        groupName: "Alert",
        desc: "??????",
        isSupportTheme: true,
        navigatorPage: (BuildContext context) {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return  const AlertPage();
            },
          ));
        }));
    return GroupInfo(groupName: "????????????", children: children, isExpand: true);
  }
  //
  // /// ????????????
  // static GroupInfo _getChartGroup() {
  //   List<GroupInfo> children = [];
  //   children.add(GroupInfo(
  //       groupName: "BrokenLine ????????? ",
  //       desc: "???????????????",
  //       navigatorPage: (BuildContext context) {
  //         rootBundle.loadString('assets/brokenline_data.json').then((data) {
  //           var brokenData = <DBDataNodeModel>[]..addAll(
  //               ((JsonDecoder().convert(data) as List?) ?? [])
  //                   .map((o) => DBDataNodeModel.fromJson(o)));
  //           Navigator.push(context, MaterialPageRoute(
  //             builder: (BuildContext context) {
  //               return BrokenLineExample(brokenData);
  //             },
  //           ));
  //         });
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Radar ?????????",
  //       desc: "???????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return RadarChartExamplePage();
  //           },
  //         ));
  //       }));
  //
  //   children.add(GroupInfo(
  //       groupName: "Funnel ?????????",
  //       desc: "???????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return FunnelChartExamplePage();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Doughnut ?????????",
  //       desc: "?????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return DoughnutChartExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Progress ?????????",
  //       desc: "?????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return ProgressChartExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "ProgressBar ?????????",
  //       desc: "?????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return ProgressBarChartExample();
  //           },
  //         ));
  //       }));
  //   return GroupInfo(groupName: "????????????", children: children, isExpand: true);
  // }
  //
  // /// ????????????
  // static GroupInfo _getDataInputGroup() {
  //   List<GroupInfo> children = [];
  //   children.add(GroupInfo(
  //       groupName: "Form ?????????",
  //       desc: "???????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return AllFormItemStyleExamplePage("?????????????????????");
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Picker ?????????",
  //       desc: "????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return PickerEntryPage("Picker??????");
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Appraise ??????",
  //       desc: "???????????????????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return AppraiseExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Input ???????????????",
  //       desc: "????????????????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return BrnInputTextExample();
  //           },
  //         ));
  //       }));
  //   return GroupInfo(groupName: "????????????", children: children, isExpand: false);
  // }
  //
  // /// ???????????????
  // static GroupInfo _getOperateGroup() {
  //   List<GroupInfo> children = [];
  //   children.add(GroupInfo(
  //       groupName: "Dialog ??????",
  //       desc: "Dialog??????????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return DialogEntryPage("Dialog????????????");
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "ActionSheet ????????????",
  //       desc: "??????????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return ActionSheetEntryPage("ActionSheet??????");
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Tips ??????",
  //       desc: "???????????????????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return PopWindowExamplePage("Tips ????????????");
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Toast ??????",
  //       desc: "?????? Toast",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return ToastExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Loading ?????????",
  //       desc: "??????loading",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return LoadingExample();
  //           },
  //         ));
  //       }));
  //   return GroupInfo(groupName: "????????????", children: children, isExpand: false);
  // }
  //
  // /// ?????????
  // static GroupInfo _getNavigatorGroup() {
  //   List<GroupInfo> children = [];
  //   children.add(GroupInfo(
  //       groupName: "Appbar ?????????",
  //       desc: "Appbar ?????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return AppbarEntryPage();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Search ??????",
  //       desc: "???????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return SearchTextExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Tabs ??????",
  //       desc: "tab",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return BrnTabExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "BottomTabBar ????????????",
  //       desc: "????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(builder: (context) {
  //           return BottomTabbarExample();
  //         }));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Selection ??????",
  //       desc: "?????????+????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return SelectionEntryPage();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "CitySelection ????????????",
  //       desc: "????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return _buildSingleSelectCityPage();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Anchor ??????",
  //       desc: "?????? Tab ????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return ScrollActorTabExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Guide ??????",
  //       desc: "?????????&?????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return GuideEntryPage();
  //           },
  //         ));
  //       }));
  //   return GroupInfo(groupName: "??????", children: children);
  // }
  //
  // /// ??????
  // static GroupInfo _getButtonGroup() {
  //   List<GroupInfo> children = [];
  //   children.add(GroupInfo(
  //       groupName: "NormalButton ????????????",
  //       desc: "????????????????????????????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return ButtonEntryPage();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "BottomButtonPanel ????????????",
  //       desc: "??????????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return BottomButtonEntryWidget();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "ButtonPanel ????????????",
  //       desc: "????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return ButtonPanelEntryPage();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "IconButton ????????????",
  //       desc: "button???????????????????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return BrnIconBtnExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Radio ????????????",
  //       desc: "????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return RadioExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Checkbox ????????????",
  //       desc: "????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return CheckboxExample();
  //           },
  //         ));
  //       }));
  //   return GroupInfo(groupName: "??????", children: children, isExpand: false);
  // }
  //
  // /// ??????
  // static GroupInfo _getContentGroup() {
  //   List<GroupInfo> children = [];
  //   children.add(GroupInfo(
  //       groupName: "Tag ??????",
  //       desc: "??????????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return TagExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "RatingBar ??????",
  //       desc: "???????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return RatingExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "DashedLine ???????????????",
  //       desc: "???????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return DashedLineExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "ShadowCard ????????????",
  //       desc: "BrnShadowCard",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return BrnShadowExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Title ??????",
  //       desc: "??????????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return TitleExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "AbnormalCard ????????????",
  //       desc: "????????????????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return AbnormalStatesEntryPage("??????????????????");
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Bubble ?????? ",
  //       desc: "????????????&???????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return BubbleEntryPage();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "StepBar ?????????",
  //       desc: "??????&???????????????",
  //       isSupportTheme: true,
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return StepExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Notification ??????",
  //       desc: "????????????????????????????????????????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return BrnNoticeBarExample();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Text ????????????",
  //       desc: "?????????????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return TextContentEntryPage();
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Calendar??????",
  //       desc: "????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return CalendarViewExample("????????????");
  //           },
  //         ));
  //       }));
  //   children.add(GroupInfo(
  //       groupName: "Gallery ??????",
  //       desc: "????????????&????????????",
  //       navigatorPage: (BuildContext context) {
  //         Navigator.push(context, MaterialPageRoute(
  //           builder: (BuildContext context) {
  //             return GalleryExample();
  //           },
  //         ));
  //       }));
  //   return GroupInfo(groupName: "??????", children: children);
  // }

  // /// ????????????
  // static Widget _buildSingleSelectCityPage() {
  //   List<BrnSelectCityModel> hotCityList = [];
  //   hotCityList.addAll([
  //     BrnSelectCityModel(name: "?????????"),
  //     BrnSelectCityModel(name: "?????????"),
  //     BrnSelectCityModel(name: "?????????"),
  //     BrnSelectCityModel(name: "?????????"),
  //     BrnSelectCityModel(name: "?????????"),
  //     BrnSelectCityModel(name: "?????????"),
  //   ]);
  //   return BrnSingleSelectCityPage(
  //     appBarTitle: '????????????',
  //     hotCityTitle: '?????????????????????',
  //     hotCityList: hotCityList,
  //   );
  // }
}
