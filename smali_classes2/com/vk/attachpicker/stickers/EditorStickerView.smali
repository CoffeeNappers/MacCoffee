.class public Lcom/vk/attachpicker/stickers/EditorStickerView;
.super Landroid/widget/FrameLayout;
.source "EditorStickerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/stickers/EditorStickerView$Mask;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$PagerAdapter;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiHolder;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiAdapter;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$MaskAdapter;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$RecentAdapter;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$Adapter;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$MaskHolder;,
        Lcom/vk/attachpicker/stickers/EditorStickerView$StickerHolder;
    }
.end annotation


# static fields
.field private static final emojis:[Ljava/lang/String;

.field private static final timeoutLock:Lcom/vk/core/util/TimeoutLock;


# instance fields
.field private final additionTopPading:I

.field private bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

.field private emojiRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private init:Z

.field private isFirstDataUpdate:Z

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private final masksItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/stickers/EditorStickerView$Mask;",
            ">;"
        }
    .end annotation
.end field

.field private pager:Landroid/support/v4/view/ViewPager;

.field private final recentStickersItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/stickers/Stickers$RecentSticker;",
            ">;"
        }
    .end annotation
.end field

.field private selector:Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

.field private settingsTabIndex:I

.field private final sidePadding:I

.field private final stickersItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;"
        }
    .end annotation
.end field

.field private tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

.field private tabsContainer:Landroid/widget/FrameLayout;

.field private tabsOuterContainer:Landroid/widget/FrameLayout;

.field private topPadding:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 39
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x1f4

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    sput-object v0, Lcom/vk/attachpicker/stickers/EditorStickerView;->timeoutLock:Lcom/vk/core/util/TimeoutLock;

    .line 517
    const/16 v0, 0xa2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string/jumbo v2, "1f600.png"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string/jumbo v2, "1f62c.png"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "1f601.png"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "1f602.png"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "1f603.png"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "1f604.png"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "1f605.png"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "1f606.png"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "1f607.png"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "1f609.png"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "1f60a.png"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "1f642.png"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "1f643.png"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, "263a.png"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string/jumbo v2, "1f60b.png"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string/jumbo v2, "1f60c.png"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string/jumbo v2, "1f60d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string/jumbo v2, "1f618.png"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string/jumbo v2, "1f617.png"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string/jumbo v2, "1f619.png"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string/jumbo v2, "1f61a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string/jumbo v2, "1f61c.png"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string/jumbo v2, "1f61d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string/jumbo v2, "1f61b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string/jumbo v2, "1f911.png"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string/jumbo v2, "1f913.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string/jumbo v2, "1f60e.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string/jumbo v2, "1f917.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string/jumbo v2, "1f60f.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string/jumbo v2, "1f636.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string/jumbo v2, "1f610.png"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string/jumbo v2, "1f611.png"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string/jumbo v2, "1f612.png"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string/jumbo v2, "1f644.png"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string/jumbo v2, "1f914.png"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string/jumbo v2, "1f633.png"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string/jumbo v2, "1f61e.png"

    aput-object v2, v0, v1

    const/16 v1, 0x25

    const-string/jumbo v2, "1f61f.png"

    aput-object v2, v0, v1

    const/16 v1, 0x26

    const-string/jumbo v2, "1f620.png"

    aput-object v2, v0, v1

    const/16 v1, 0x27

    const-string/jumbo v2, "1f621.png"

    aput-object v2, v0, v1

    const/16 v1, 0x28

    const-string/jumbo v2, "1f614.png"

    aput-object v2, v0, v1

    const/16 v1, 0x29

    const-string/jumbo v2, "1f615.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2a

    const-string/jumbo v2, "1f641.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2b

    const-string/jumbo v2, "2639.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2c

    const-string/jumbo v2, "1f623.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2d

    const-string/jumbo v2, "1f616.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2e

    const-string/jumbo v2, "1f62b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x2f

    const-string/jumbo v2, "1f629.png"

    aput-object v2, v0, v1

    const/16 v1, 0x30

    const-string/jumbo v2, "1f624.png"

    aput-object v2, v0, v1

    const/16 v1, 0x31

    const-string/jumbo v2, "1f62e.png"

    aput-object v2, v0, v1

    const/16 v1, 0x32

    const-string/jumbo v2, "1f631.png"

    aput-object v2, v0, v1

    const/16 v1, 0x33

    const-string/jumbo v2, "1f628.png"

    aput-object v2, v0, v1

    const/16 v1, 0x34

    const-string/jumbo v2, "1f630.png"

    aput-object v2, v0, v1

    const/16 v1, 0x35

    const-string/jumbo v2, "1f62f.png"

    aput-object v2, v0, v1

    const/16 v1, 0x36

    const-string/jumbo v2, "1f626.png"

    aput-object v2, v0, v1

    const/16 v1, 0x37

    const-string/jumbo v2, "1f627.png"

    aput-object v2, v0, v1

    const/16 v1, 0x38

    const-string/jumbo v2, "1f622.png"

    aput-object v2, v0, v1

    const/16 v1, 0x39

    const-string/jumbo v2, "1f625.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3a

    const-string/jumbo v2, "1f62a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3b

    const-string/jumbo v2, "1f613.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3c

    const-string/jumbo v2, "1f62d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3d

    const-string/jumbo v2, "1f635.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3e

    const-string/jumbo v2, "1f632.png"

    aput-object v2, v0, v1

    const/16 v1, 0x3f

    const-string/jumbo v2, "1f910.png"

    aput-object v2, v0, v1

    const/16 v1, 0x40

    const-string/jumbo v2, "1f637.png"

    aput-object v2, v0, v1

    const/16 v1, 0x41

    const-string/jumbo v2, "1f912.png"

    aput-object v2, v0, v1

    const/16 v1, 0x42

    const-string/jumbo v2, "1f915.png"

    aput-object v2, v0, v1

    const/16 v1, 0x43

    const-string/jumbo v2, "1f634.png"

    aput-object v2, v0, v1

    const/16 v1, 0x44

    const-string/jumbo v2, "1f4a4.png"

    aput-object v2, v0, v1

    const/16 v1, 0x45

    const-string/jumbo v2, "1f4a9.png"

    aput-object v2, v0, v1

    const/16 v1, 0x46

    const-string/jumbo v2, "1f608.png"

    aput-object v2, v0, v1

    const/16 v1, 0x47

    const-string/jumbo v2, "1f47f.png"

    aput-object v2, v0, v1

    const/16 v1, 0x48

    const-string/jumbo v2, "1f479.png"

    aput-object v2, v0, v1

    const/16 v1, 0x49

    const-string/jumbo v2, "1f47a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4a

    const-string/jumbo v2, "1f480.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4b

    const-string/jumbo v2, "1f47b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4c

    const-string/jumbo v2, "1f47d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4d

    const-string/jumbo v2, "1f916.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4e

    const-string/jumbo v2, "1f63a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x4f

    const-string/jumbo v2, "1f638.png"

    aput-object v2, v0, v1

    const/16 v1, 0x50

    const-string/jumbo v2, "1f639.png"

    aput-object v2, v0, v1

    const/16 v1, 0x51

    const-string/jumbo v2, "1f63b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x52

    const-string/jumbo v2, "1f63c.png"

    aput-object v2, v0, v1

    const/16 v1, 0x53

    const-string/jumbo v2, "1f63d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x54

    const-string/jumbo v2, "1f640.png"

    aput-object v2, v0, v1

    const/16 v1, 0x55

    const-string/jumbo v2, "1f63f.png"

    aput-object v2, v0, v1

    const/16 v1, 0x56

    const-string/jumbo v2, "1f63e.png"

    aput-object v2, v0, v1

    const/16 v1, 0x57

    const-string/jumbo v2, "1f64c.png"

    aput-object v2, v0, v1

    const/16 v1, 0x58

    const-string/jumbo v2, "1f44f.png"

    aput-object v2, v0, v1

    const/16 v1, 0x59

    const-string/jumbo v2, "1f44b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x5a

    const-string/jumbo v2, "1f44d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x5b

    const-string/jumbo v2, "1f44e.png"

    aput-object v2, v0, v1

    const/16 v1, 0x5c

    const-string/jumbo v2, "1f44a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x5d

    const-string/jumbo v2, "270a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x5e

    const-string/jumbo v2, "270c.png"

    aput-object v2, v0, v1

    const/16 v1, 0x5f

    const-string/jumbo v2, "1f44c.png"

    aput-object v2, v0, v1

    const/16 v1, 0x60

    const-string/jumbo v2, "270b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x61

    const-string/jumbo v2, "1f450.png"

    aput-object v2, v0, v1

    const/16 v1, 0x62

    const-string/jumbo v2, "1f4aa.png"

    aput-object v2, v0, v1

    const/16 v1, 0x63

    const-string/jumbo v2, "1f64f.png"

    aput-object v2, v0, v1

    const/16 v1, 0x64

    const-string/jumbo v2, "261d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x65

    const-string/jumbo v2, "1f446.png"

    aput-object v2, v0, v1

    const/16 v1, 0x66

    const-string/jumbo v2, "1f447.png"

    aput-object v2, v0, v1

    const/16 v1, 0x67

    const-string/jumbo v2, "1f448.png"

    aput-object v2, v0, v1

    const/16 v1, 0x68

    const-string/jumbo v2, "1f449.png"

    aput-object v2, v0, v1

    const/16 v1, 0x69

    const-string/jumbo v2, "1f595.png"

    aput-object v2, v0, v1

    const/16 v1, 0x6a

    const-string/jumbo v2, "1f590.png"

    aput-object v2, v0, v1

    const/16 v1, 0x6b

    const-string/jumbo v2, "1f918.png"

    aput-object v2, v0, v1

    const/16 v1, 0x6c

    const-string/jumbo v2, "1f596.png"

    aput-object v2, v0, v1

    const/16 v1, 0x6d

    const-string/jumbo v2, "1f48b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x6e

    const-string/jumbo v2, "1f436.png"

    aput-object v2, v0, v1

    const/16 v1, 0x6f

    const-string/jumbo v2, "1f431.png"

    aput-object v2, v0, v1

    const/16 v1, 0x70

    const-string/jumbo v2, "1f42d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x71

    const-string/jumbo v2, "1f439.png"

    aput-object v2, v0, v1

    const/16 v1, 0x72

    const-string/jumbo v2, "1f430.png"

    aput-object v2, v0, v1

    const/16 v1, 0x73

    const-string/jumbo v2, "1f43b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x74

    const-string/jumbo v2, "1f43c.png"

    aput-object v2, v0, v1

    const/16 v1, 0x75

    const-string/jumbo v2, "1f428.png"

    aput-object v2, v0, v1

    const/16 v1, 0x76

    const-string/jumbo v2, "1f42f.png"

    aput-object v2, v0, v1

    const/16 v1, 0x77

    const-string/jumbo v2, "1f981.png"

    aput-object v2, v0, v1

    const/16 v1, 0x78

    const-string/jumbo v2, "1f42e.png"

    aput-object v2, v0, v1

    const/16 v1, 0x79

    const-string/jumbo v2, "1f437.png"

    aput-object v2, v0, v1

    const/16 v1, 0x7a

    const-string/jumbo v2, "1f43d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x7b

    const-string/jumbo v2, "1f438.png"

    aput-object v2, v0, v1

    const/16 v1, 0x7c

    const-string/jumbo v2, "1f419.png"

    aput-object v2, v0, v1

    const/16 v1, 0x7d

    const-string/jumbo v2, "1f435.png"

    aput-object v2, v0, v1

    const/16 v1, 0x7e

    const-string/jumbo v2, "1f648.png"

    aput-object v2, v0, v1

    const/16 v1, 0x7f

    const-string/jumbo v2, "1f649.png"

    aput-object v2, v0, v1

    const/16 v1, 0x80

    const-string/jumbo v2, "1f64a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x81

    const-string/jumbo v2, "1f412.png"

    aput-object v2, v0, v1

    const/16 v1, 0x82

    const-string/jumbo v2, "1f414.png"

    aput-object v2, v0, v1

    const/16 v1, 0x83

    const-string/jumbo v2, "1f427.png"

    aput-object v2, v0, v1

    const/16 v1, 0x84

    const-string/jumbo v2, "1f426.png"

    aput-object v2, v0, v1

    const/16 v1, 0x85

    const-string/jumbo v2, "1f424.png"

    aput-object v2, v0, v1

    const/16 v1, 0x86

    const-string/jumbo v2, "1f423.png"

    aput-object v2, v0, v1

    const/16 v1, 0x87

    const-string/jumbo v2, "1f425.png"

    aput-object v2, v0, v1

    const/16 v1, 0x88

    const-string/jumbo v2, "1f43a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x89

    const-string/jumbo v2, "1f417.png"

    aput-object v2, v0, v1

    const/16 v1, 0x8a

    const-string/jumbo v2, "1f434.png"

    aput-object v2, v0, v1

    const/16 v1, 0x8b

    const-string/jumbo v2, "1f984.png"

    aput-object v2, v0, v1

    const/16 v1, 0x8c

    const-string/jumbo v2, "1f31a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x8d

    const-string/jumbo v2, "1f31d.png"

    aput-object v2, v0, v1

    const/16 v1, 0x8e

    const-string/jumbo v2, "1f31e.png"

    aput-object v2, v0, v1

    const/16 v1, 0x8f

    const-string/jumbo v2, "2728.png"

    aput-object v2, v0, v1

    const/16 v1, 0x90

    const-string/jumbo v2, "26a1.png"

    aput-object v2, v0, v1

    const/16 v1, 0x91

    const-string/jumbo v2, "1f525.png"

    aput-object v2, v0, v1

    const/16 v1, 0x92

    const-string/jumbo v2, "1f4a5.png"

    aput-object v2, v0, v1

    const/16 v1, 0x93

    const-string/jumbo v2, "2764.png"

    aput-object v2, v0, v1

    const/16 v1, 0x94

    const-string/jumbo v2, "1f49b.png"

    aput-object v2, v0, v1

    const/16 v1, 0x95

    const-string/jumbo v2, "1f49a.png"

    aput-object v2, v0, v1

    const/16 v1, 0x96

    const-string/jumbo v2, "1f499.png"

    aput-object v2, v0, v1

    const/16 v1, 0x97

    const-string/jumbo v2, "1f49c.png"

    aput-object v2, v0, v1

    const/16 v1, 0x98

    const-string/jumbo v2, "1f494.png"

    aput-object v2, v0, v1

    const/16 v1, 0x99

    const-string/jumbo v2, "2763.png"

    aput-object v2, v0, v1

    const/16 v1, 0x9a

    const-string/jumbo v2, "1f495.png"

    aput-object v2, v0, v1

    const/16 v1, 0x9b

    const-string/jumbo v2, "1f49e.png"

    aput-object v2, v0, v1

    const/16 v1, 0x9c

    const-string/jumbo v2, "1f493.png"

    aput-object v2, v0, v1

    const/16 v1, 0x9d

    const-string/jumbo v2, "1f497.png"

    aput-object v2, v0, v1

    const/16 v1, 0x9e

    const-string/jumbo v2, "1f496.png"

    aput-object v2, v0, v1

    const/16 v1, 0x9f

    const-string/jumbo v2, "1f498.png"

    aput-object v2, v0, v1

    const/16 v1, 0xa0

    const-string/jumbo v2, "1f49d.png"

    aput-object v2, v0, v1

    const/16 v1, 0xa1

    const-string/jumbo v2, "1f49f.png"

    aput-object v2, v0, v1

    sput-object v0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojis:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

    .prologue
    const/4 v6, 0x0

    const/16 v4, 0x8

    const/4 v5, 0x0

    .line 71
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 41
    new-instance v1, Lcom/vk/attachpicker/stickers/EditorStickerView$1;

    invoke-direct {v1, p0}, Lcom/vk/attachpicker/stickers/EditorStickerView$1;-><init>(Lcom/vk/attachpicker/stickers/EditorStickerView;)V

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 48
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->isFirstDataUpdate:Z

    .line 50
    const/16 v1, 0x28

    invoke-static {v1}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    iput v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->additionTopPading:I

    .line 51
    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v1

    iput v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->sidePadding:I

    .line 55
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->recentStickersItems:Ljava/util/ArrayList;

    .line 56
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->stickersItems:Ljava/util/ArrayList;

    .line 57
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->masksItems:Ljava/util/ArrayList;

    .line 72
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f03019e

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 73
    iput-object p2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->selector:Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

    .line 74
    const v1, -0x19000001

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->setBackgroundColor(I)V

    .line 76
    new-instance v1, Lcom/vk/attachpicker/widget/EmojiAutofitRecyclerView;

    invoke-direct {v1, p1}, Lcom/vk/attachpicker/widget/EmojiAutofitRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojiRecyclerView:Landroid/support/v7/widget/RecyclerView;

    .line 77
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojiRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/RecyclerView;->setClipToPadding(Z)V

    .line 78
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojiRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Landroid/support/v7/widget/GridLayoutManager;

    const/4 v3, 0x5

    invoke-direct {v2, p1, v3}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 79
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojiRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiAdapter;

    invoke-direct {v2, p0, v6}, Lcom/vk/attachpicker/stickers/EditorStickerView$EmojiAdapter;-><init>(Lcom/vk/attachpicker/stickers/EditorStickerView;Lcom/vk/attachpicker/stickers/EditorStickerView$1;)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 80
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojiRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    iget v3, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->additionTopPading:I

    invoke-static {v4}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v4

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 82
    const v1, 0x7f100471

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabsOuterContainer:Landroid/widget/FrameLayout;

    .line 83
    const v1, 0x7f100451

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabsContainer:Landroid/widget/FrameLayout;

    .line 84
    new-instance v1, Lcom/vk/attachpicker/stickers/StickersTabStrip;

    invoke-direct {v1, p1}, Lcom/vk/attachpicker/stickers/StickersTabStrip;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    .line 85
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    invoke-virtual {v1, v5, v5, v5, v5}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->setPadding(IIII)V

    .line 86
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    invoke-static {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/stickers/EditorStickerView;)Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->setDelegate(Lcom/vk/attachpicker/stickers/StickersTabStrip$ScrollSlidingTabStripDelegate;)V

    .line 93
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    const/16 v2, 0x30

    invoke-static {v2}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 94
    .local v0, "tabBarLp":Landroid/widget/FrameLayout$LayoutParams;
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabsContainer:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    invoke-virtual {v1, v2, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 96
    const v1, 0x7f100470

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/view/ViewPager;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    .line 97
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v2, Lcom/vk/attachpicker/stickers/EditorStickerView$PagerAdapter;

    invoke-direct {v2, p0, v6}, Lcom/vk/attachpicker/stickers/EditorStickerView$PagerAdapter;-><init>(Lcom/vk/attachpicker/stickers/EditorStickerView;Lcom/vk/attachpicker/stickers/EditorStickerView$1;)V

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 98
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    new-instance v2, Lcom/vk/attachpicker/stickers/EditorStickerView$2;

    invoke-direct {v2, p0}, Lcom/vk/attachpicker/stickers/EditorStickerView$2;-><init>(Lcom/vk/attachpicker/stickers/EditorStickerView;)V

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 113
    const v1, 0x7f100472

    invoke-virtual {p0, v1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/widget/EditorBottomPanel;

    iput-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    .line 114
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    const v2, 0x7f0202ac

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setRightButtonResId(I)V

    .line 115
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->getContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0f00ba

    invoke-static {v2, v3}, Landroid/support/v4/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setRightButtonTint(I)V

    .line 116
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    invoke-virtual {v1, v5}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setDividerVisible(Z)V

    .line 117
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    invoke-static {p2}, Lcom/vk/attachpicker/stickers/EditorStickerView$$Lambda$2;->lambdaFactory$(Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setOnCancelClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->bottomPanel:Lcom/vk/attachpicker/widget/EditorBottomPanel;

    invoke-static {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView$$Lambda$3;->lambdaFactory$(Lcom/vk/attachpicker/stickers/EditorStickerView;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/widget/EditorBottomPanel;->setOnApplyClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    return-void
.end method

.method static synthetic access$000(Lcom/vk/attachpicker/stickers/EditorStickerView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->updateData()V

    return-void
.end method

.method static synthetic access$1000(Lcom/vk/attachpicker/stickers/EditorStickerView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    iget v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->additionTopPading:I

    return v0
.end method

.method static synthetic access$1100(Lcom/vk/attachpicker/stickers/EditorStickerView;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;
    .param p1, "x1"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->isRecentTab(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Lcom/vk/attachpicker/stickers/EditorStickerView;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->recentStickersItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vk/attachpicker/stickers/EditorStickerView;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;
    .param p1, "x1"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->isMasksTab(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lcom/vk/attachpicker/stickers/EditorStickerView;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->masksItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/vk/attachpicker/stickers/EditorStickerView;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->stickersItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300()Lcom/vk/core/util/TimeoutLock;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/vk/attachpicker/stickers/EditorStickerView;->timeoutLock:Lcom/vk/core/util/TimeoutLock;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vk/attachpicker/stickers/EditorStickerView;)Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->selector:Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;

    return-object v0
.end method

.method static synthetic access$500()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 37
    sget-object v0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojis:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vk/attachpicker/stickers/EditorStickerView;I)Z
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;
    .param p1, "x1"    # I

    .prologue
    .line 37
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/stickers/EditorStickerView;->isEmojiTab(I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/vk/attachpicker/stickers/EditorStickerView;)Landroid/support/v7/widget/RecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojiRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vk/attachpicker/stickers/EditorStickerView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    iget v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->sidePadding:I

    return v0
.end method

.method static synthetic access$900(Lcom/vk/attachpicker/stickers/EditorStickerView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/attachpicker/stickers/EditorStickerView;

    .prologue
    .line 37
    iget v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->topPadding:I

    return v0
.end method

.method private isEmojiTab(I)Z
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 438
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isMasksTab(I)Z
    .locals 2
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x1

    .line 450
    if-ne p1, v0, :cond_0

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->masksItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isRecentTab(I)Z
    .locals 3
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x1

    .line 442
    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->masksItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_2

    .line 443
    if-ne p1, v0, :cond_1

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->recentStickersItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 445
    :cond_0
    :goto_0
    return v0

    :cond_1
    move v0, v1

    .line 443
    goto :goto_0

    .line 445
    :cond_2
    const/4 v2, 0x2

    if-ne p1, v2, :cond_3

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->recentStickersItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-gtz v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method static synthetic lambda$new$1(Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;Landroid/view/View;)V
    .locals 0
    .param p0, "listener"    # Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 118
    invoke-interface {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView$Listener;->close()V

    .line 119
    return-void
.end method

.method private updateData()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    .line 172
    const/4 v4, 0x1

    .line 174
    .local v4, "newSettingsTabIndex":I
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->stickersItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 175
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    invoke-virtual {v7}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->removeTabs()V

    .line 176
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    const v8, 0x7f020372

    invoke-virtual {v7, v8}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->addIconTab(I)V

    .line 178
    invoke-static {}, Lcom/vk/attachpicker/util/PickerStickers;->getCached()Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;

    move-result-object v3

    .line 179
    .local v3, "masks":Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;
    if-eqz v3, :cond_2

    iget-object v7, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->baseUrl:Ljava/lang/String;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    iget-object v7, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->stickerIds:[I

    if-eqz v7, :cond_2

    iget-object v7, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->stickerIds:[I

    array-length v7, v7

    if-lez v7, :cond_2

    .line 180
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->masksItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 183
    iget-object v7, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->baseUrl:Ljava/lang/String;

    const-string/jumbo v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 184
    iget-object v1, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->baseUrl:Ljava/lang/String;

    .line 188
    .local v1, "baseUrl":Ljava/lang/String;
    :goto_0
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    iget-object v7, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->stickerIds:[I

    array-length v7, v7

    if-ge v2, v7, :cond_1

    .line 189
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->masksItems:Ljava/util/ArrayList;

    new-instance v8, Lcom/vk/attachpicker/stickers/EditorStickerView$Mask;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->stickerIds:[I

    aget v10, v10, v2

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const/16 v10, 0x2f

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v9

    .line 190
    invoke-static {}, Lcom/vk/core/util/Screen;->realWidth()I

    move-result v10

    div-int/lit8 v10, v10, 0x3

    const/4 v11, 0x5

    new-array v11, v11, [I

    fill-array-data v11, :array_0

    invoke-static {v10, v11}, Lcom/vkontakte/android/data/orm/StickerStockItem;->adjustSize(I[I)I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ".png"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iget-object v10, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->stickerIds:[I

    aget v10, v10, v2

    invoke-direct {v8, v9, v10}, Lcom/vk/attachpicker/stickers/EditorStickerView$Mask;-><init>(Ljava/lang/String;I)V

    .line 189
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 188
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 186
    .end local v1    # "baseUrl":Ljava/lang/String;
    .end local v2    # "i":I
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v3, Lcom/vk/attachpicker/util/PickerStickers$PickerStickersResult;->baseUrl:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "/"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "baseUrl":Ljava/lang/String;
    goto :goto_0

    .line 195
    .restart local v2    # "i":I
    :cond_1
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->masksItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_2

    .line 196
    add-int/lit8 v4, v4, 0x1

    .line 197
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    const v8, 0x7f02036a

    invoke-virtual {v7, v8}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->addIconTab(I)V

    .line 201
    .end local v1    # "baseUrl":Ljava/lang/String;
    .end local v2    # "i":I
    :cond_2
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/stickers/Stickers;->getRecent()Ljava/util/List;

    move-result-object v5

    .line 202
    .local v5, "recentStickers":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/stickers/Stickers$RecentSticker;>;"
    if-eqz v5, :cond_3

    .line 203
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->recentStickersItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 204
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->recentStickersItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 206
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_3

    .line 207
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    const v8, 0x7f0202ab

    invoke-virtual {v7, v8}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->addIconTab(I)V

    .line 208
    add-int/lit8 v4, v4, 0x1

    .line 212
    :cond_3
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/stickers/Stickers;->getActivatedStickers()Ljava/util/List;

    move-result-object v0

    .line 213
    .local v0, "activatedStickers":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    if-eqz v0, :cond_4

    .line 214
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->stickersItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 215
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->stickersItems:Ljava/util/ArrayList;

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 217
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 218
    .local v6, "sticker":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iget-object v8, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    invoke-virtual {v8, v6}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->addStickerTab(Lcom/vkontakte/android/data/orm/StickerStockItem;)V

    .line 219
    add-int/lit8 v4, v4, 0x1

    .line 220
    goto :goto_2

    .line 222
    .end local v6    # "sticker":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_4
    iput v4, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->settingsTabIndex:I

    .line 224
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    const v8, 0x7f020371

    invoke-virtual {v7, v8}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->addIconTab(I)V

    .line 226
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v7}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v7

    invoke-virtual {v7}, Landroid/support/v4/view/PagerAdapter;->notifyDataSetChanged()V

    .line 227
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->checkSelection()V

    .line 229
    iget-boolean v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->isFirstDataUpdate:Z

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->masksItems:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_5

    .line 230
    iget-object v7, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v8, 0x1

    invoke-virtual {v7, v8, v12}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    .line 232
    :cond_5
    iput-boolean v12, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->isFirstDataUpdate:Z

    .line 233
    return-void

    .line 190
    :array_0
    .array-data 4
        0x40
        0x80
        0x100
        0x160
        0x200
    .end array-data
.end method


# virtual methods
.method public checkSelection()V
    .locals 2

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabbar:Lcom/vk/attachpicker/stickers/StickersTabStrip;

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/StickersTabStrip;->selectTab(I)V

    .line 140
    return-void
.end method

.method public hasOverlappingRendering()Z
    .locals 1

    .prologue
    .line 144
    const/4 v0, 0x0

    return v0
.end method

.method synthetic lambda$new$0(I)V
    .locals 2
    .param p1, "page"    # I

    .prologue
    .line 87
    iget v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->settingsTabIndex:I

    if-ne p1, v0, :cond_0

    .line 88
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->start(Landroid/app/Activity;)V

    .line 92
    :goto_0
    return-void

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    goto :goto_0
.end method

.method synthetic lambda$new$2(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 121
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StickerStoreFragment;->start(Landroid/app/Activity;)V

    .line 122
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 5

    .prologue
    .line 149
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 151
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 152
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_UPDATED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 153
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_RELOADED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 154
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_DOWNLOAD_PROGRESS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 155
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_UPDATED_RECENTS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 156
    const-string/jumbo v1, "com.vkontakte.android.STICKERS_NUM_NEW_ITEMS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 157
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->mReceiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 159
    iget-boolean v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->init:Z

    if-nez v1, :cond_0

    .line 160
    invoke-direct {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->updateData()V

    .line 161
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->init:Z

    .line 163
    :cond_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 167
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 168
    invoke-virtual {p0}, Lcom/vk/attachpicker/stickers/EditorStickerView;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 169
    return-void
.end method

.method public setTopPadding(I)V
    .locals 7
    .param p1, "topPadding"    # I

    .prologue
    const/4 v6, 0x0

    .line 126
    iput p1, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->topPadding:I

    .line 127
    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->tabsOuterContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v6, p1, v6, v6}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    .line 129
    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->emojiRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget v3, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->sidePadding:I

    iget v4, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->additionTopPading:I

    add-int/2addr v4, p1

    iget v5, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->sidePadding:I

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    .line 130
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2}, Landroid/support/v4/view/ViewPager;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 131
    iget-object v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->pager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v2, v0}, Landroid/support/v4/view/ViewPager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 132
    .local v1, "v":Landroid/view/View;
    instance-of v2, v1, Landroid/support/v7/widget/RecyclerView;

    if-eqz v2, :cond_0

    .line 133
    iget v2, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->sidePadding:I

    iget v3, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->additionTopPading:I

    add-int/2addr v3, p1

    iget v4, p0, Lcom/vk/attachpicker/stickers/EditorStickerView;->sidePadding:I

    invoke-virtual {v1, v2, v3, v4, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 130
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 136
    .end local v1    # "v":Landroid/view/View;
    :cond_1
    return-void
.end method
