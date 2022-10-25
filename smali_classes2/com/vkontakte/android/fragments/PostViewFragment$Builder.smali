.class public Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
.super Lcom/vkontakte/android/navigation/Navigator;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static final KEY_COMMENT:Ljava/lang/String; = "comment"

.field private static final KEY_ENTRY:Ljava/lang/String; = "entry"

.field private static final KEY_LOAD_COMMENTS_FROM_BEGINNING:Ljava/lang/String; = "load_comments_from_beginning"

.field private static final KEY_PHOTO_VIEWER:Ljava/lang/String; = "photo_viewer"

.field private static final KEY_PLACER_PROFILE:Ljava/lang/String; = "placer_profile"

.field private static final KEY_REFER:Ljava/lang/String; = "referer"

.field private static final KEY_RESET_SCROLL:Ljava/lang/String; = "reset_scroll"

.field private static final KEY_SCROLL_TO_COMMENTS:Ljava/lang/String; = "scroll_to_comments"

.field private static final KEY_SCROLL_TO_FIRST_COMMENT:Ljava/lang/String; = "scroll_to_first_comment"

.field private static final KEY_TAG_ID:Ljava/lang/String; = "tag_id"


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 2
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 180
    const-class v0, Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;)V

    .line 181
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "entry"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 182
    return-void
.end method


# virtual methods
.method protected isValidNavigator()Z
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "entry"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public loadFromBeginning()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 3

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "load_comments_from_beginning"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 226
    return-object p0
.end method

.method public resetScroll(Z)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 2
    .param p1, "value"    # Z

    .prologue
    .line 205
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "reset_scroll"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 206
    return-object p0
.end method

.method public scrollToComments()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 3

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "scroll_to_comments"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 221
    return-object p0
.end method

.method public scrollToFirstComment()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 3

    .prologue
    .line 230
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "scroll_to_first_comment"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 231
    return-object p0
.end method

.method public setComment(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 2
    .param p1, "comment"    # I

    .prologue
    .line 190
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "comment"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 191
    return-object p0
.end method

.method public setIsPhotoViewer()Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 3

    .prologue
    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "photo_viewer"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 196
    return-object p0
.end method

.method public setPlacerProfile(Lcom/vkontakte/android/UserProfile;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 2
    .param p1, "placerProfile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "placer_profile"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 211
    return-object p0
.end method

.method public setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 2
    .param p1, "refer"    # Ljava/lang/String;

    .prologue
    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "referer"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    return-object p0
.end method

.method public setTagId(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;
    .locals 2
    .param p1, "tagId"    # I

    .prologue
    .line 215
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->args:Landroid/os/Bundle;

    const-string/jumbo v1, "tag_id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 216
    return-object p0
.end method
