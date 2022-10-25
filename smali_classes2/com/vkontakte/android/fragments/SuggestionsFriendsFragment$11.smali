.class Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;
.super Ljava/lang/Object;
.source "SuggestionsFriendsFragment.java"

# interfaces
.implements Lcom/facebook/GraphRequest$GraphJSONArrayCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->importFacebook(Lcom/facebook/AccessToken;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

.field final synthetic val$session:Lcom/facebook/AccessToken;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;Lcom/facebook/AccessToken;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    .prologue
    .line 788
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->val$session:Lcom/facebook/AccessToken;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted(Lorg/json/JSONArray;Lcom/facebook/GraphResponse;)V
    .locals 8
    .param p1, "users"    # Lorg/json/JSONArray;
    .param p2, "response"    # Lcom/facebook/GraphResponse;

    .prologue
    .line 791
    invoke-virtual {p2}, Lcom/facebook/GraphResponse;->getError()Lcom/facebook/FacebookRequestError;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 792
    iget-object v5, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 793
    iget-object v5, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->access$300(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;)Landroid/app/ProgressDialog;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 795
    :cond_0
    iget-object v5, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const v6, 0x7f0801f9

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V

    .line 829
    :cond_1
    :goto_0
    return-void

    .line 798
    :cond_2
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-nez v5, :cond_3

    .line 799
    iget-object v5, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 800
    iget-object v5, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->access$300(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;)Landroid/app/ProgressDialog;

    move-result-object v5

    invoke-static {v5}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    .line 801
    iget-object v5, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    new-instance v6, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11$1;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11$1;-><init>(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;)V

    invoke-virtual {v5, v6}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 814
    :cond_3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 816
    .local v0, "friends":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_4

    .line 817
    invoke-virtual {p1, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 818
    .local v4, "user":Lorg/json/JSONObject;
    new-instance v2, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v2}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 819
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    new-instance v5, Landroid/os/Bundle;

    invoke-direct {v5}, Landroid/os/Bundle;-><init>()V

    iput-object v5, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 820
    iget-object v5, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v6, "external_id"

    const-string/jumbo v7, "id"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 821
    const-string/jumbo v5, "name"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 822
    const/high16 v5, 0x42700000    # 60.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    .line 823
    .local v3, "photoSize":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "https://graph.facebook.com/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v2, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "external_id"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "/picture?width="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, "&height="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 824
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 816
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 826
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    .end local v3    # "photoSize":I
    .end local v4    # "user":Lorg/json/JSONObject;
    :catch_0
    move-exception v5

    .line 828
    :cond_4
    iget-object v5, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    iget-object v6, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$11;->val$session:Lcom/facebook/AccessToken;

    invoke-virtual {v6}, Lcom/facebook/AccessToken;->getUserId()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, "facebook"

    invoke-static {v5, v0, v6, v7}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->access$800(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method
