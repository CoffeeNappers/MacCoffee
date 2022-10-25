.class public Lcom/vkontakte/android/fragments/SuggestionsFragment$UserPhotosAdapter;
.super Ljava/lang/Object;
.source "SuggestionsFragment.java"

# interfaces
.implements Lme/grishka/appkit/preloading/PrefetchInfoProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SuggestionsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "UserPhotosAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestionsFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SuggestionsFragment;

    .prologue
    .line 250
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$UserPhotosAdapter;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 1
    .param p1, "item"    # I

    .prologue
    .line 258
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 1
    .param p1, "item"    # I
    .param p2, "image"    # I

    .prologue
    .line 263
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$UserPhotosAdapter;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SuggestionsFragment;->users:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFragment$UserPhotosAdapter;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SuggestionsFragment;->users:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
