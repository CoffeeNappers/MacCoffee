.class Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$Item;
.super Ljava/lang/Object;
.source "SuggestionsFriendsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Item"
.end annotation


# instance fields
.field descRes:I

.field imgRes:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

.field titleRes:I

.field type:I


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;)V
    .locals 0

    .prologue
    .line 963
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$Item;->this$0:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$1;

    .prologue
    .line 963
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment$Item;-><init>(Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;)V

    return-void
.end method
