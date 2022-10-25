.class public Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "NewPostFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/news/NewPostFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 114
    const-class v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;

    new-instance v1, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>()V

    const/16 v2, 0x11

    .line 115
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x43e10000    # 450.0f

    .line 116
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setPreferredHeight(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/16 v2, 0x10

    .line 117
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setInputMode(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x44340000    # 720.0f

    .line 118
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const/high16 v2, 0x42000000    # 32.0f

    .line 119
    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    const v2, 0x106000b

    .line 120
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v1

    .line 114
    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;)V

    .line 122
    return-void
.end method


# virtual methods
.method public attachAttachments([Lcom/vkontakte/android/attachments/Attachment;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "attachments"    # [Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "attachments"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 160
    return-object p0
.end method

.method public attachCamera(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "camera"    # Z

    .prologue
    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "camera"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 180
    return-object p0
.end method

.method public attachGroup(Lcom/vkontakte/android/api/Group;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "group"    # Lcom/vkontakte/android/api/Group;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 184
    if-eqz p1, :cond_0

    .line 185
    iget-object v0, p1, Lcom/vkontakte/android/api/Group;->name:Ljava/lang/String;

    iget-object v1, p1, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachGroup(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object p0

    .line 187
    .end local p0    # "this":Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    :cond_0
    return-object p0
.end method

.method public attachGroup(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "photo"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 191
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "group_title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "group_photo"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    return-object p0
.end method

.method public attachPhoto(Landroid/net/Uri;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "photo"    # Landroid/net/Uri;

    .prologue
    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "photoURI"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 170
    return-object p0
.end method

.method public attachPhotos(Ljava/util/ArrayList;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;"
        }
    .end annotation

    .prologue
    .line 154
    .local p1, "photos":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "photos"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 155
    return-object p0
.end method

.method public attachPost(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "post"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 164
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "edit"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 165
    return-object p0
.end method

.method public attachText(Ljava/lang/String;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "text"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    return-object p0
.end method

.method public forbidAttachmentsEdit(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "forbid"    # Z

    .prologue
    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "forbid_attach_edit"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 218
    return-object p0
.end method

.method public isPublic(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "isPublic"    # Z

    .prologue
    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "public"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 198
    return-object p0
.end method

.method public send(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "send"    # Z

    .prologue
    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "send_action"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 213
    return-object p0
.end method

.method public setBoardComment(Lcom/vkontakte/android/api/board/BoardComment;II)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 3
    .param p1, "boardComment"    # Lcom/vkontakte/android/api/board/BoardComment;
    .param p2, "topicId"    # I
    .param p3, "groupId"    # I

    .prologue
    .line 125
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 127
    .local v0, "ce":Lcom/vkontakte/android/NewsEntry;
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "topic_id"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 128
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "group_id"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 129
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "comment"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 131
    iget-object v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 132
    iget-object v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 133
    const/16 v1, 0xe

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 135
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachPost(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 136
    return-object p0
.end method

.method public setMarketComment(Lcom/vkontakte/android/api/board/BoardComment;I)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 3
    .param p1, "boardComment"    # Lcom/vkontakte/android/api/board/BoardComment;
    .param p2, "groupId"    # I

    .prologue
    .line 140
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0}, Lcom/vkontakte/android/NewsEntry;-><init>()V

    .line 142
    .local v0, "ce":Lcom/vkontakte/android/NewsEntry;
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "group_id"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 143
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v2, "comment"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 145
    iget-object v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 146
    iget-object v1, p1, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 147
    const/16 v1, 0x11

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    .line 149
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachPost(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    .line 150
    return-object p0
.end method

.method public suggest(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "suggest"    # Z

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "suggest"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 208
    return-object p0
.end method

.method public uid(I)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;
    .locals 2
    .param p1, "uid"    # I

    .prologue
    .line 202
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "uid"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 203
    return-object p0
.end method
