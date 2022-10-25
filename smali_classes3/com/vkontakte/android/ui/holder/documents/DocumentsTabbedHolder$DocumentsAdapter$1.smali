.class Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;
.super Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;
.source "DocumentsTabbedHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
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
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 136
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->this$0:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 4

    .prologue
    .line 150
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .local v0, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    new-instance v3, Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/Document;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 153
    .local v1, "result":Landroid/content/Intent;
    const-string/jumbo v2, "documents"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 154
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 155
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 156
    return-void
.end method

.method protected bridge synthetic setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/BaseDocument;)V
    .locals 0

    .prologue
    .line 136
    check-cast p2, Lcom/vkontakte/android/api/Document;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/Document;)V

    return-void
.end method

.method protected setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/Document;)V
    .locals 2
    .param p1, "info"    # Landroid/widget/TextView;
    .param p2, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 139
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/documents/DocumentHolder;->setInfo(Landroid/widget/TextView;Lcom/vkontakte/android/api/BaseDocument;)V

    .line 140
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    iget-object v0, v0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->thumb:Lcom/vk/imageloader/view/VKImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 146
    :goto_0
    return-void

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->thumb:Lcom/vk/imageloader/view/VKImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 144
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->thumb:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter$1;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Document;

    iget-object v0, v0, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_0
.end method
