.class public Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field static final KEY_REF:Ljava/lang/String; = "ref"

.field static final KEY_REF_SOURCE:Ljava/lang/String; = "ref_source"


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 2
    .param p1, "uid"    # I
    .param p2, "title"    # Ljava/lang/String;

    .prologue
    .line 207
    const-class v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 209
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "title"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    return-void
.end method


# virtual methods
.method public setAttachments([Landroid/os/Parcelable;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .param p1, "attachments"    # [Landroid/os/Parcelable;

    .prologue
    .line 235
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "attachments"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 236
    return-object p0
.end method

.method public setFwd(Ljava/util/ArrayList;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<+",
            "Landroid/os/Parcelable;",
            ">;)",
            "Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;"
        }
    .end annotation

    .prologue
    .line 240
    .local p1, "fwd":Ljava/util/ArrayList;, "Ljava/util/ArrayList<+Landroid/os/Parcelable;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "fwd"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 241
    return-object p0
.end method

.method public setMessageId(I)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .param p1, "messageId"    # I

    .prologue
    .line 245
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "msg_id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 246
    return-object p0
.end method

.method public setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .param p1, "photo"    # Ljava/lang/CharSequence;

    .prologue
    .line 213
    if-eqz p1, :cond_0

    .line 214
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "photo"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 216
    :cond_0
    return-object p0
.end method

.method public setPhotos(Ljava/util/ArrayList;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;"
        }
    .end annotation

    .prologue
    .line 220
    .local p1, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "photos"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 221
    return-object p0
.end method

.method public setPost(Landroid/os/Parcelable;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .param p1, "post"    # Landroid/os/Parcelable;

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "post"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 226
    return-object p0
.end method

.method public setRef(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .param p1, "ref"    # Ljava/lang/String;

    .prologue
    .line 250
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ref"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    return-object p0
.end method

.method public setRefSource(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .param p1, "refSource"    # Ljava/lang/String;

    .prologue
    .line 255
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "ref_source"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    return-object p0
.end method

.method public setText(Ljava/lang/String;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "text"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    return-object p0
.end method
