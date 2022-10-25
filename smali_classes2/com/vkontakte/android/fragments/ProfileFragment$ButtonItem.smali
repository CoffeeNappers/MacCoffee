.class Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;
.super Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ButtonItem"
.end annotation


# instance fields
.field final appId:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final title:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/String;)V
    .locals 1
    .param p2, "appId"    # I
    .param p3, "title"    # Ljava/lang/String;

    .prologue
    .line 3664
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    .line 3665
    iput p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;->appId:I

    .line 3666
    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;->title:Ljava/lang/String;

    .line 3667
    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 5

    .prologue
    .line 3676
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0301c7

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$ButtonViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 3671
    const v0, -0x18894

    return v0
.end method
