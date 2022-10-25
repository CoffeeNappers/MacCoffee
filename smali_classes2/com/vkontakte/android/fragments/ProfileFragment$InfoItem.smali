.class abstract Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
.super Ljava/lang/Object;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "InfoItem"
.end annotation


# instance fields
.field public backgroundType:I

.field public dividerAfter:Z

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0

    .prologue
    .line 3547
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/ProfileFragment$1;

    .prologue
    .line 3547
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-void
.end method


# virtual methods
.method public abstract createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 3557
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 3561
    const/4 v0, 0x0

    return-object v0
.end method

.method public abstract getType()I
.end method
