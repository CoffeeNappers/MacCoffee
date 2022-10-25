.class Lcom/vkontakte/android/fragments/ProfileFragment$15;
.super Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->buildInfoItems()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 1856
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2

    .prologue
    .line 1869
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$15$1;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$15;->view:Landroid/view/View;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$15$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$15;Landroid/view/View;)V

    return-object v0
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 1859
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 1864
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$15;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/api/ExtendedUserProfile;->invitedBy:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    return-object v0
.end method
