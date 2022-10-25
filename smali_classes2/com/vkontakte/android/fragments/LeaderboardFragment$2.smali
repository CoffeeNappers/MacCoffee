.class Lcom/vkontakte/android/fragments/LeaderboardFragment$2;
.super Ljava/lang/Object;
.source "LeaderboardFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/LeaderboardFragment;->setupDialog(Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/LeaderboardFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/LeaderboardFragment;

    .prologue
    .line 126
    iput-object p1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$2;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 130
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$2;->this$0:Lcom/vkontakte/android/fragments/LeaderboardFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/LeaderboardFragment;->dismiss()V

    .line 131
    return-void
.end method
