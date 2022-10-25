.class Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$6$1;
.super Ljava/lang/Object;
.source "SuggestionsFriendsFragment.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$6;->success(Lcom/vkontakte/android/api/account/AccountLookupContacts$Result;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$6;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$6;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$6;

    .prologue
    .line 483
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$6$1;->this$1:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/UserProfile;)I
    .locals 2
    .param p1, "userProfile"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "userProfile2"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 486
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    iget-object v1, p2, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 483
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    check-cast p2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$6$1;->compare(Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/UserProfile;)I

    move-result v0

    return v0
.end method
