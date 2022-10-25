.class Lcom/vkontakte/android/fragments/ProfileFragment$12;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->loadInitial(ZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/users/GetFullProfile$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field final synthetic val$count:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/app/Fragment;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 1126
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->val$count:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$success$0(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1133
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method synthetic lambda$success$1(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->onBackPressed()V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/users/GetFullProfile$Result;)V
    .locals 4
    .param p1, "res"    # Lcom/vkontakte/android/api/users/GetFullProfile$Result;

    .prologue
    const/4 v3, 0x1

    .line 1129
    iget-object v1, p1, Lcom/vkontakte/android/api/users/GetFullProfile$Result;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1130
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0801f9

    .line 1131
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080493

    .line 1132
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$12$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment$12;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 1133
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$12$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment$12;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v2

    .line 1134
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1135
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1162
    :goto_0
    return-void

    .line 1139
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 1140
    .local v0, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v1, p1, Lcom/vkontakte/android/api/users/GetFullProfile$Result;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1141
    invoke-static {v0, v3}, Lcom/vkontakte/android/cache/Cache;->updatePeers(Ljava/util/List;Z)V

    .line 1143
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v2, p1, Lcom/vkontakte/android/api/users/GetFullProfile$Result;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$002(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/api/ExtendedUserProfile;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    .line 1144
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2400(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 1146
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2500(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 1148
    iget-object v1, p1, Lcom/vkontakte/android/api/users/GetFullProfile$Result;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    invoke-virtual {v1}, Lcom/vkontakte/android/api/ExtendedUserProfile;->hasCover()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1149
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2600(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 1154
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2702(Lcom/vkontakte/android/fragments/ProfileFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 1155
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2800(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    .line 1156
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/ExtendedUserProfile;->isDeactivated()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1157
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v2, 0x0

    iget v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->val$count:I

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$2900(Lcom/vkontakte/android/fragments/ProfileFragment;II)V

    .line 1159
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->updateList()V

    .line 1161
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->setTitle(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 1150
    :cond_3
    iget-object v1, p1, Lcom/vkontakte/android/api/users/GetFullProfile$Result;->profile:Lcom/vkontakte/android/api/ExtendedUserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-gez v1, :cond_1

    .line 1151
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$12;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment;->parallaxPreDrawListener:Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$ParallaxPreDrawListener;->showToolbar(Z)V

    goto :goto_1
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1126
    check-cast p1, Lcom/vkontakte/android/api/users/GetFullProfile$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$12;->success(Lcom/vkontakte/android/api/users/GetFullProfile$Result;)V

    return-void
.end method
