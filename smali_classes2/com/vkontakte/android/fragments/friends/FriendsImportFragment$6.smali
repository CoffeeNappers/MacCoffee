.class Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$6;
.super Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;
.source "FriendsImportFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->updateItems()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;III)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
    .param p2, "icon"    # I
    .param p3, "title"    # I
    .param p4, "subtitle"    # I

    .prologue
    .line 215
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$6;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    invoke-direct {p0, p2, p3, p4}, Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;-><init>(III)V

    return-void
.end method


# virtual methods
.method public action()V
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$6;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;->legacy:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$Legacy;->openSearch()V

    .line 219
    return-void
.end method
