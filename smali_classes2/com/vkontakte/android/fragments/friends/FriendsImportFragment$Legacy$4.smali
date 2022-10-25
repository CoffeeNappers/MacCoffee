.class Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;
.super Landroid/app/Activity;
.source "FriendsImportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->startImportFacebook()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    .prologue
    .line 896
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public getApplicationContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 914
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getPackageManager()Landroid/content/pm/PackageManager;
    .locals 1

    .prologue
    .line 904
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 909
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public startActivityForResult(Landroid/content/Intent;I)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "code"    # I

    .prologue
    .line 898
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-static {v0, p2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->access$1302(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;I)I

    .line 899
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy$4;->this$1:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 900
    return-void
.end method
