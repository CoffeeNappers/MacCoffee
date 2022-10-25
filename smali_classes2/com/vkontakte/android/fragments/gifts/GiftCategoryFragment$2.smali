.class Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;
.super Lcom/vkontakte/android/background/AsyncTask;
.source "GiftCategoryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/background/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/vkontakte/android/api/models/GiftCategory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 157
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/background/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/vkontakte/android/api/models/GiftCategory;
    .locals 2
    .param p1, "args"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "data"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/GiftCategory;

    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 157
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;->doInBackground([Ljava/lang/Void;)Lcom/vkontakte/android/api/models/GiftCategory;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute(Lcom/vkontakte/android/api/models/GiftCategory;)V
    .locals 2
    .param p1, "category"    # Lcom/vkontakte/android/api/models/GiftCategory;

    .prologue
    .line 166
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$002(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;Lcom/vkontakte/android/api/models/GiftCategory;)Lcom/vkontakte/android/api/models/GiftCategory;

    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/models/GiftCategory;->title:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$400(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;Ljava/lang/CharSequence;)V

    .line 168
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/models/GiftCategory;->items:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$500(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;Ljava/util/List;)V

    .line 169
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 157
    check-cast p1, Lcom/vkontakte/android/api/models/GiftCategory;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$2;->onPostExecute(Lcom/vkontakte/android/api/models/GiftCategory;)V

    return-void
.end method
