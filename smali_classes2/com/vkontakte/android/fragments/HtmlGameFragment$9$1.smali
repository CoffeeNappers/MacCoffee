.class Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;
.super Ljava/lang/Object;
.source "HtmlGameFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->success(Lcom/vkontakte/android/api/Order;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

.field final synthetic val$order:Lcom/vkontakte/android/api/Order;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment$9;Lcom/vkontakte/android/api/Order;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

    .prologue
    .line 787
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;->val$order:Lcom/vkontakte/android/api/Order;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 791
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$type:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$item:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;->val$order:Lcom/vkontakte/android/api/Order;

    iget v3, v3, Lcom/vkontakte/android/api/Order;->orderId:I

    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

    iget v4, v4, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$attemtpsCount:I

    add-int/lit8 v4, v4, 0x1

    iget-object v5, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$9$1;->this$1:Lcom/vkontakte/android/fragments/HtmlGameFragment$9;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/HtmlGameFragment$9;->val$callback:Lcom/vkontakte/android/api/Callback;

    invoke-static/range {v0 .. v5}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1700(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;IILcom/vkontakte/android/api/Callback;)V

    .line 793
    return-void
.end method
