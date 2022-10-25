.class Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;
.super Lcom/vkontakte/android/ui/holder/UserHolder;
.source "SuggestionsImportedFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/UserHolder",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;Landroid/view/ViewGroup;)V
    .locals 6
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v3, 0x0

    .line 199
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;

    .line 200
    const v2, 0x7f03020c

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p2

    move v4, v3

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/UserHolder;-><init>(Landroid/view/ViewGroup;IZZZ)V

    .line 201
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 2
    .param p1, "user"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 205
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    .line 206
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->mActionButton:Landroid/view/View;

    iget v0, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 207
    return-void

    .line 206
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 197
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->itemView:Landroid/view/View;

    if-ne p1, v0, :cond_1

    .line 212
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;->onItemClick(Lcom/vkontakte/android/UserProfile;)V

    .line 216
    :cond_0
    :goto_0
    return-void

    .line 213
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->mActionButton:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 214
    iget-object v1, p0, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->this$0:Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment$ItemHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/friends/SuggestionsImportedFragment;->onInviteClick(Lcom/vkontakte/android/UserProfile;)V

    goto :goto_0
.end method
