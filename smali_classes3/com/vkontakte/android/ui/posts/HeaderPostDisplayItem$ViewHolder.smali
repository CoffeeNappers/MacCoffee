.class Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;
.super Ljava/lang/Object;
.source "HeaderPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field adsAction:Landroid/widget/TextView;

.field adsTitle:Landroid/widget/TextView;

.field ageRestriction:Landroid/widget/TextView;

.field menuBtn:Landroid/view/View;

.field name:Landroid/widget/TextView;

.field photo:Lcom/vk/imageloader/view/VKImageView;

.field profileBtn:Landroid/view/View;

.field subscribeBtn:Landroid/widget/ImageView;

.field time:Landroid/widget/TextView;

.field unSubscribeBtn:Landroid/view/View;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 426
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$1;

    .prologue
    .line 426
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/HeaderPostDisplayItem$ViewHolder;-><init>()V

    return-void
.end method
