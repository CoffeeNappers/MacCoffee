.class Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$10;
.super Landroid/app/Activity;
.source "SuggestionsFriendsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->startImportFacebook()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    .prologue
    .line 762
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$10;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public getApplicationContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 780
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$10;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method public getPackageManager()Landroid/content/pm/PackageManager;
    .locals 1

    .prologue
    .line 770
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$10;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 775
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$10;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->getActivity()Landroid/app/Activity;

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
    .line 764
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$10;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-static {v0, p2}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->access$1202(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;I)I

    .line 765
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$10;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 766
    return-void
.end method
