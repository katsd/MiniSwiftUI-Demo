//
// Created by Katsu Matsuda on 2022/07/19.
//

import Foundation

struct SlideView: View {

    @State var page = 0

    let pageCount = 16

    @State var page_uiComponent_event_hovering = false
    @State var page_uiComponent_event_clickCount = 0

    @State var page_stateManagement_count = 0
    @State var page_stateManagement_hover1 = false
    @State var page_stateManagement_hover2 = false

    var body: some View {
        Group {
            if page == 0 {
                Slide_Title()
            } else if page == 1 {
                SlidePage2Column(title: "宣言型UIフレームワーク", leftTitle: "", rightTitle: "", left: { Image(name: "SampleCode") }, right: { Image(name: "SampleView") })
            } else if page == 2 {
                Slide_ProjectPurpose()
            } else if page == 3 {
                Slide_ProjectGoal()
            } else if page == 4 {
                Slide_Progress1Q()
            } else if page == 5 {
                Page_UIComponent_Graphic()
            } else if page == 6 {
                Page_UIComponent_Event(hovering: $page_uiComponent_event_hovering, clickCount: $page_uiComponent_event_clickCount)
            } else if page == 7 {
                Page_StateManagement(image: "CounterCode", count: $page_stateManagement_count, hover1: $page_stateManagement_hover1, hover2: $page_stateManagement_hover2)
            } else if page == 8 {
                SlidePage2Column(title: "UIの状態管理", leftTitle: "", rightTitle: "", left: { Image(name: "CounterCode") }, right: { Image(name: "ViewGraph0") })
            } else if page == 9 {
                Page_StateManagement(image: "ViewGraph0", count: $page_stateManagement_count, hover1: $page_stateManagement_hover1, hover2: $page_stateManagement_hover2)
            } else if page == 10 {
                Page_StateManagement(image: "ViewGraph1", count: $page_stateManagement_count, hover1: $page_stateManagement_hover1, hover2: $page_stateManagement_hover2)
            } else if page == 11 {
                Page_StateManagement(image: "ViewGraph2", count: $page_stateManagement_count, hover1: $page_stateManagement_hover1, hover2: $page_stateManagement_hover2)
            } else if page == 12 {
                Page_StateManagement(image: "ViewGraph3", count: $page_stateManagement_count, hover1: $page_stateManagement_hover1, hover2: $page_stateManagement_hover2)
            } else if page == 13 {
                Slide_Progress2Q(showScore: false)
            } else if page == 14 {
                Slide_Progress2Q(showScore: true)
            } else if page == 15 {
                Color.white.overlay(
                    Text("デモ")
                        .fontSize(50)
                        .fontWeight(.regular)
                )
            }
        }
            .overlay(
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            page = (page - 1 + pageCount) % pageCount
                        }) {
                            Color.gray.opacity(0.3)
                                .frame(width: 20, height: 20)
                                .cornerRadius(10)
                                .overlay(
                                    Text("←")
                                        .foregroundColor(.gray)
                                )
                        }
                            .padding(left: 0, top: 10, right: 5, bottom: 10)
                        Button(action: {
                            page = (page + 1) % pageCount
                        }) {
                            Color.gray.opacity(0.3)
                                .frame(width: 20, height: 20)
                                .cornerRadius(10)
                                .overlay(
                                    Text("→")
                                        .foregroundColor(.gray)
                                )
                        }
                            .padding(left: 5, top: 10, right: 10, bottom: 10)
                    }
                        .frame(height: 40)
                }
            )
    }
}

struct Slide_Title: View {
    var body: some View {
        Color.white
            .overlay(
                VStack {
                    Text("SwiftUIライクな宣言型UIフレームワークの実装")
                        .fitToParent()
                        .frame(height: 100)
                        .padding(5)
                    Text("松田 活")
                        .foregroundColor(.gray)
                        .fitToParent()
                        .frame(height: 80)
                        .padding(5)
                }
            )
    }
}

struct Slide_ProjectPurpose: View {
    var body: some View {
        SlidePage(title: "プロジェクトの目的") {
            VStack {
                HStack {
                    Text("・SwiftUIをはじめとした既存の宣言型UIフレームワークに対する理解の強化")
                        .fontSize(40)
                    EmptyView()
                        .frame(width: .infinity, height: 0)
                }
                    .padding(horizontal: 0, vertical: 10)

                HStack {
                    Text("・MetalKitの基本的な使い方の習得")
                        .fontSize(40)
                    EmptyView()
                        .frame(width: .infinity, height: 0)
                }
                    .padding(horizontal: 0, vertical: 10)
            }
        }
    }
}


struct Slide_ProjectGoal: View {
    var body: some View {
        SlidePage(title: "プロジェクトのゴール") {
            GeometryReader { geo in
                HStack {
                    VStack {
                        HStack {
                            Text("""
                                 ・ 指定したレイアウトの通りに画面を描画できるようにする

                                 ・ テキスト、ボタン、リストなどの基本的なUIコンポーネントを実装する

                                 ・ UIの状態管理、差分更新などのアルゴリズムを実装する

                                 ・ TODOリストなどの簡単なアプリケーションを実装する
                                 """)
                                .textAlignment(.left)
                                .fontSize(40)
                                .frame(width: geo.size.width * 2 / 3)

                            EmptyView()
                                .frame(width: .infinity, height: 0)
                        }
                    }
                        .frame(width: geo.size.width * 2 / 3)
                    Image(name: "TODOList")
                }
            }
        }
    }
}


struct Slide_Progress1Q: View {
    var body: some View {
        SlidePage(title: "達成状況(中間発表時点)") {
            GeometryReader { geo in
                VStack {
                    ProgressItem(geo: geo, title: "・指定したレイアウトの通りに画面を描画できるようにする", percentage: 0.7, percentageLabel: "7割程度")
                        .padding(horizontal: 0, vertical: 20)

                    ProgressItem(geo: geo, title: "・テキスト、ボタン、リストなどの基本的なUIコンポーネントを実装する", percentage: 0.01, percentageLabel: "0%")
                        .padding(horizontal: 0, vertical: 20)

                    ProgressItem(geo: geo, title: "・UIの状態管理、差分更新などのアルゴリズムを実装する", percentage: 0.01, percentageLabel: "0%")
                        .padding(horizontal: 0, vertical: 20)

                    ProgressItem(geo: geo, title: "・TODOリストなどの簡単なアプリケーションを実装する", percentage: 0.01, percentageLabel: "0%")
                        .padding(horizontal: 0, vertical: 20)
                }
            }
        }
    }
}

struct Slide_Progress2Q: View {
    let showScore: Bool

    var body: some View {
        SlidePage(title: "達成状況(現時点)") {
            GeometryReader { geo in
                VStack {
                    ProgressItem(geo: geo, title: "・指定したレイアウトの通りに画面を描画できるようにする", percentage: 1, percentageLabel: "達成")
                        .padding(horizontal: 0, vertical: 20)

                    ProgressItem(geo: geo, title: "・テキスト、ボタン、リストなどの基本的なUIコンポーネントを実装する", percentage: 0.9, percentageLabel: "ほぼ達成")
                        .padding(horizontal: 0, vertical: 20)

                    ProgressItem(geo: geo, title: "・UIの状態管理、差分更新などのアルゴリズムを実装する", percentage: 0.9, percentageLabel: "ほぼ達成")
                        .padding(horizontal: 0, vertical: 20)

                    ProgressItem(geo: geo, title: "・TODOリストなどの簡単なアプリケーションを実装する", percentage: 1, percentageLabel: "達成")
                        .padding(horizontal: 0, vertical: 20)

                    if showScore {
                        Spacer()
                            .overlay(
                                HStack {
                                    Text("自己評価 :")
                                        .fontSize(70)
                                        .fontWeight(.semibold)
                                        .padding()
                                    Text("A")
                                        .fontSize(70)
                                        .fontWeight(.semibold)
                                        .foregroundColor(.red)
                                        .padding()
                                }
                            )
                    }
                }

            }
        }
    }
}

struct ProgressItem: View {
    let geo: GeometryProxy
    let title: String
    let percentage: Double
    let percentageLabel: String

    var body: some View {
        HStack {
            Text(title)
                .textAlignment(.left)
                .fontSize(40)
                .frame(width: geo.size.width * 2 / 3)

            EmptyView()
                .frame(width: .infinity, height: 0)

            Color.green.opacity(0.5)
                .frame(width: geo.size.width / 3 - 30, height: 70)
                .overlay(
                    GeometryReader { progressBarGeo in
                        ZStack {
                            HStack {
                                Color.green
                                    .frame(width: progressBarGeo.size.width * percentage)
                                EmptyView()
                                    .frame(width: .infinity, height: 0)
                            }

                            HStack {
                                EmptyView()
                                    .frame(width: .infinity, height: 0)
                                Text(percentageLabel)
                                    .fontSize(35)
                                    .padding(horizontal: 10, vertical: 0)
                            }
                        }
                    }
                )
        }
    }
}

struct Page_UIComponent_Graphic: View {
    var body: some View {
        SlidePage2Column(
            title: "UIコンポーネントの実装",
            leftTitle: "中間発表",
            rightTitle: "現時点",
            left: {
                VStack {
                    Color.pink
                    HStack {
                        Color.cyan
                        Color.yellow
                            .frame(width: 50)
                    }
                }
                    .frame(width: 300, height: 300)
            },
            right: {
                VStack {
                    Text("ABCDEFG")
                        .fontSize(40)
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding()
                    Text("あいうえお")
                        .fontSize(40)
                        .fontWeight(.light)
                        .foregroundColor(.blue)
                        .padding()
                    Color.pink
                        .frame(width: 80, height: 80)
                        .cornerRadius(40)
                        .padding()

                    Color.green
                        .cornerRadius(10)
                        .frame(width: 200, height: 70)
                        .padding()
                }
            }
        )
    }
}

struct Page_UIComponent_Event: View {

    @Binding var hovering: Bool
    @Binding var clickCount: Int

    var body: some View {
        SlidePage2Column(
            title: "UIコンポーネントの実装",
            leftTitle: "",
            rightTitle: "",
            left: {
                VStack {
                    Rectangle()
                        .foregroundColor(hovering ? .indigo : .blue)
                        .frame(width: 400, height: 200)
                        .overlay(
                            Text(hovering ? "Hovering" : "")
                                .foregroundColor(.white)
                                .fontSize(50)
                        )
                        .onHover {
                            hovering = $0
                            print("hovering")
                        }
                        .padding()

                    Color.pink
                        .frame(width: 400, height: 200)
                        .overlay(
                            Text("Click count : \(clickCount)")
                                .foregroundColor(.white)
                                .fontSize(50)
                        )
                        .onClick { clickCount += 1 }
                        .padding()
                }
            },
            right: {
                VStack {
                    Button(action: {}) {
                        Color.blue
                            .overlay(
                                Text("Button")
                                    .foregroundColor(.white)
                                    .fontSize(40)
                            )
                            .frame(width: 200, height: 100)
                            .background(Color.blue)
                            .cornerRadius(20)
                    }
                        .padding(40)

                    HStack {
                        Button(action: {}) {
                            Color.orange.opacity(0.5)
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                                .overlay(
                                    Text("🐈")
                                        .fontSize(40)
                                )
                        }
                            .padding(40)

                        Button(action: {}) {
                            Text("Button")
                                .foregroundColor(.blue)
                                .fontSize(40)
                        }
                            .padding(40)
                    }
                }

            })
    }
}

struct Page_StateManagement: View {
    let image: String

    @Binding var count: Int
    @Binding var hover1: Bool
    @Binding var hover2: Bool

    var body: some View {
        SlidePage2Column(
            title: "UIの状態管理",
            leftTitle: "",
            rightTitle: "",
            left: {
                Image(name: image)
            },
            right: {
                VStack {
                    Text("\(count)")
                        .fontSize(50)
                        .fontWeight(.bold)
                        .padding()
                    HStack {
                        Rectangle()
                            .foregroundColor(hover1 ? .cyan : .blue)
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                            .overlay(
                                Text("-")
                                    .foregroundColor(.white)
                                    .fontSize(50)
                                    .fontWeight(.bold)
                            )
                            .onHover { hover1 = $0 }
                            .onClick {
                                count -= 1
                            }
                            .padding()

                        Rectangle()
                            .foregroundColor(hover2 ? .cyan : .blue)
                            .frame(width: 100, height: 100)
                            .cornerRadius(20)
                            .overlay(
                                Text("+")
                                    .foregroundColor(.white)
                                    .fontSize(50)
                                    .fontWeight(.bold)
                            )
                            .onHover { hover2 = $0 }
                            .onClick {
                                count += 1
                            }
                            .padding()
                    }
                }
            }
        )
    }
}

struct SlidePage<Content>: View where Content: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text(title)
                        .fontSize(60)
                    Spacer()
                }
                    .frame(height: 80)
                content
                    .padding(left: 0, top: 40, right: 0, bottom: 0)
            }
        }
            .padding(20)
            .background(Color.white)
    }
}

struct SlidePage2Column<LeftContent, RightContent>: View where LeftContent: View, RightContent: View {
    let title: String
    let leftTitle: String
    let rightTitle: String
    let leftContent: LeftContent
    let rightContent: RightContent

    init(title: String, leftTitle: String, rightTitle: String, @ViewBuilder left: () -> LeftContent, @ViewBuilder right: () -> RightContent) {
        self.title = title
        self.leftTitle = leftTitle
        self.rightTitle = rightTitle
        leftContent = left()
        rightContent = right()
    }

    var body: some View {
        SlidePage(title: title) {
            HStack {
                Spacer()
                    .overlay(
                        VStack {
                            Text(leftTitle)
                                .fontSize(40)
                                .padding(left: 0, top: 0, right: 0, bottom: 10)
                            Spacer()
                                .overlay(leftContent)
                        }
                    )
                Spacer()
                    .overlay(
                        VStack {
                            Text(rightTitle)
                                .fontSize(40)
                                .padding(left: 0, top: 0, right: 0, bottom: 10)
                            Spacer()
                                .overlay(rightContent)
                        }
                    )
            }
        }
    }
}

struct ContentView: View {
    @State var cnt = 0

    @State var width: Double = 100

    @State var hover = false

    @State var hover2 = false

    var body__: some View {
        Rectangle()
            .foregroundColor(.white)
            .overlay(
                VStack {
                    Text("SwiftUIライクな宣言型UIフレームワークの実装")
                    Text("松田 活")
                        .foregroundColor(.gray)
                }
            )
    }

    var body: some View {
        VStack {
            Text("Hello")
                .foregroundColor(.white)
                .padding()
            HStack {
                Rectangle()
                    .foregroundColor(hover ? .cyan : .blue)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    .overlay(
                        Text("-")
                    )
                    .onHover { hover = $0 }
                    .onClick {
                        cnt -= 1
                    }
                    .padding()

                /*
                Button(action: { cnt = 0 }) {
                    VStack {
                        Text("0")
                            .foregroundColor(.white)
                    }
                        .frame(width: 50, height: 50)
                        .background(Rectangle().foregroundColor(.blue).cornerRadius(10))
                }
                    .padding()
                 */

                Rectangle()
                    .foregroundColor(hover2 ? .cyan : .blue)
                    .frame(width: 50, height: 50)
                    .cornerRadius(10)
                    .overlay(
                        Text("+")
                    )
                    .onHover { hover2 = $0 }
                    .onClick {
                        cnt += 1
                    }
                    .padding()
            }
                .background(Color.green)
        }
    }
}
