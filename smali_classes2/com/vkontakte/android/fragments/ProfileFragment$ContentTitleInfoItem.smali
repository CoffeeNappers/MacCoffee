.class Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;
.super Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContentTitleInfoItem"
.end annotation


# instance fields
.field public buttonText:Ljava/lang/String;

.field public onButtonClick:Ljava/lang/Runnable;

.field public onClick:Ljava/lang/Runnable;

.field public text:Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V
    .locals 2
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "onClick"    # Ljava/lang/Runnable;

    .prologue
    .line 3634
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    .line 3632
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const v1, 0x7f08068a

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->buttonText:Ljava/lang/String;

    .line 3635
    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->text:Ljava/lang/CharSequence;

    .line 3636
    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->onClick:Ljava/lang/Runnable;

    .line 3637
    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2

    .prologue
    .line 3646
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$ContentTitleViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-object v0
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 3651
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 3656
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 3641
    const/16 v0, -0x16

    return v0
.end method
