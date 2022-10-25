.class Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;
.super Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;
.source "DocumentsByTypeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/documents/DocumentHolder",
        "<",
        "Lcom/vkontakte/android/api/Document;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 170
    iput-object p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->this$1:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 2

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->this$1:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;

    iget-object v1, v0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->onDocumentClick(Lcom/vkontakte/android/api/Document;)V

    .line 174
    return-void
.end method

.method public onLongClick()Z
    .locals 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->this$1:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;

    iget-object v1, v0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->this$0:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->onDocumentLongClick(Lcom/vkontakte/android/api/Document;)Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/BaseDocument;)V
    .locals 0

    .prologue
    .line 170
    check-cast p2, Lcom/vkontakte/android/api/Document;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/Document;)V

    return-void
.end method

.method protected setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/Document;)V
    .locals 2
    .param p1, "info"    # Landroid/widget/TextView;
    .param p2, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 183
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/BaseDocument;)V

    .line 184
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    iget-object v0, v0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->thumb:Lcom/vk/imageloader/view/VKImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 190
    :goto_0
    return-void

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->thumb:Lcom/vk/imageloader/view/VKImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 188
    iget-object v1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->thumb:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter$1;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    iget-object v0, v0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_0
.end method
