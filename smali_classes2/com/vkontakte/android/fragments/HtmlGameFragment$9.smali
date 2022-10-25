.class Lcom/vkontakte/android/fragments/HtmlGameFragment$9;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;->invokeOrderBuyItem(Ljava/lang/String;Ljava/lang/String;IILcom/vkontakte/android/api/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/api/Order;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

.field final synthetic val$attemtpsCount:I

.field final synthetic val$callback:Lcom/vkontakte/android/api/Callback;

.field final synthetic val$item:Ljava/lang/String;

.field final synthetic val$type:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;ILcom/vkontakte/android/api/Callback;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 778
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iput p2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$attemtpsCount:I

    iput-object p3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$callback:Lcom/vkontakte/android/api/Callback;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$type:Ljava/lang/String;

    iput-object p5, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$item:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 803
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$callback:Lcom/vkontakte/android/api/Callback;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/api/Callback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 804
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/Order;)V
    .locals 5
    .param p1, "order"    # Lcom/vkontakte/android/api/Order;

    .prologue
    .line 781
    iget-object v0, p1, Lcom/vkontakte/android/api/Order;->status:Ljava/lang/String;

    const-string/jumbo v1, "wait"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 782
    iget v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$attemtpsCount:I

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    .line 783
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$callback:Lcom/vkontakte/android/api/Callback;

    new-instance v1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0801f9

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;-><init>(ILjava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/vkontakte/android/api/Callback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 799
    :goto_0
    return-void

    .line 787
    :cond_0
    new-instance v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;-><init>(Lcom/vkontakte/android/fragments/HtmlGameFragment$9;Lcom/vkontakte/android/api/Order;)V

    const-wide/16 v2, 0x3e8

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_0

    .line 797
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$callback:Lcom/vkontakte/android/api/Callback;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/api/Callback;->success(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 778
    check-cast p1, Lcom/vkontakte/android/api/Order;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->success(Lcom/vkontakte/android/api/Order;)V

    return-void
.end method
