.class Lcom/vkontakte/android/fragments/ProfileFragment$20;
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

.field final synthetic val$widgetView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "view"    # Landroid/view/View;

    .prologue
    .line 2597
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$20;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$20;->val$widgetView:Landroid/view/View;

    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3

    .prologue
    .line 2600
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$20;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$20;->val$widgetView:Landroid/view/View;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment$WidgetViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    return-object v0
.end method

.method public getType()I
    .locals 2

    .prologue
    .line 2605
    const v0, 0xfeed

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$20;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->widget:Lcom/vkontakte/android/api/widget/Widget;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/widget/Widget;->getType()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
