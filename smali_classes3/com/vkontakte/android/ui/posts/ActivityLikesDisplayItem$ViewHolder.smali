.class Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;
.super Ljava/lang/Object;
.source "ActivityLikesDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ViewHolder"
.end annotation


# instance fields
.field private content:Landroid/view/View;

.field private photos:Lcom/vkontakte/android/ui/PhotoStripView;

.field private text:Landroid/widget/TextView;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$1;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Lcom/vkontakte/android/ui/PhotoStripView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;Lcom/vkontakte/android/ui/PhotoStripView;)Lcom/vkontakte/android/ui/PhotoStripView;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;
    .param p1, "x1"    # Lcom/vkontakte/android/ui/PhotoStripView;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->photos:Lcom/vkontakte/android/ui/PhotoStripView;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;
    .param p1, "x1"    # Landroid/widget/TextView;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    return-object p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;

    .prologue
    .line 75
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->content:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;Landroid/view/View;)Landroid/view/View;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 75
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->content:Landroid/view/View;

    return-object p1
.end method
