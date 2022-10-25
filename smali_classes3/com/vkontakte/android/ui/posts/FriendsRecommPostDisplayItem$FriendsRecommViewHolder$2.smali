.class Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "FriendsRecommPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;->lambda$new$0(Landroid/view/ViewGroup;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder$2;->this$1:Lcom/vkontakte/android/ui/posts/FriendsRecommPostDisplayItem$FriendsRecommViewHolder;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 0

    .prologue
    .line 182
    return-void
.end method
