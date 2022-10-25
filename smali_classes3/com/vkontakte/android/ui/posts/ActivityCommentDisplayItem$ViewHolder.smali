.class Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;
.super Ljava/lang/Object;
.source "ActivityCommentDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private content:Landroid/view/View;

.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field private text:Landroid/widget/TextView;

.field private title:Landroid/widget/TextView;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$1;

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;
    .param p1, "x1"    # Landroid/widget/TextView;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;
    .param p1, "x1"    # Landroid/widget/TextView;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->content:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;Landroid/view/View;)Landroid/view/View;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->content:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;)Lcom/vk/imageloader/view/VKImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    return-object v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;Lcom/vk/imageloader/view/VKImageView;)Lcom/vk/imageloader/view/VKImageView;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;
    .param p1, "x1"    # Lcom/vk/imageloader/view/VKImageView;

    .prologue
    .line 72
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    return-object p1
.end method
