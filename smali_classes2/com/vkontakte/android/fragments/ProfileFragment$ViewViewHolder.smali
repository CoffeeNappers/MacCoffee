.class Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V
    .locals 0
    .param p2, "itemView"    # Landroid/view/View;

    .prologue
    .line 3740
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 3741
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 3742
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V
    .locals 0
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    .prologue
    .line 3747
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3738
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$ViewViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$ViewInfoItem;)V

    return-void
.end method
