.class Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;
.super Ljava/lang/Object;
.source "RepostPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field button:Landroid/view/View;

.field name:Landroid/widget/TextView;

.field photo:Lcom/vk/imageloader/view/VKImageView;

.field time:Landroid/widget/TextView;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 167
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;

    .prologue
    .line 167
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$ViewHolder;-><init>()V

    return-void
.end method
