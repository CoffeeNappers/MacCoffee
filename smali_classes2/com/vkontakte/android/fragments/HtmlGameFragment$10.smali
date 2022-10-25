.class Lcom/vkontakte/android/fragments/HtmlGameFragment$10;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "HtmlGameFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;->prepareAndShowShare(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

.field final synthetic val$foundLink:Ljava/lang/String;

.field final synthetic val$message:Ljava/lang/String;

.field final synthetic val$target:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 842
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->val$target:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->val$message:Ljava/lang/String;

    iput-object p4, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->val$foundLink:Ljava/lang/String;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 863
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 864
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    const-string/jumbo v1, "fail"

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$2000(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    .line 865
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 842
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    const/4 v1, 0x0

    .line 845
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 846
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->val$target:Ljava/lang/String;

    const/4 v0, -0x1

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v3

    sparse-switch v3, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v0, :pswitch_data_0

    .line 854
    const-string/jumbo v0, "vk"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown share target "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->val$target:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 855
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    const-string/jumbo v1, "fail"

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$2000(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;)V

    .line 859
    :cond_1
    :goto_1
    return-void

    .line 846
    :sswitch_0
    const-string/jumbo v3, "wall"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0

    :sswitch_1
    const-string/jumbo v3, "im"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 848
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->val$message:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->val$foundLink:Ljava/lang/String;

    invoke-static {v0, v1, p1, v2}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1800(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_1

    .line 851
    :pswitch_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$10;->val$message:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    invoke-static {v2, v3, v0}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1900(Lcom/vkontakte/android/fragments/HtmlGameFragment;Ljava/lang/String;Lcom/vkontakte/android/Photo;)V

    goto :goto_1

    .line 846
    nop

    :sswitch_data_0
    .sparse-switch
        0xd24 -> :sswitch_1
        0x3791ca -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
