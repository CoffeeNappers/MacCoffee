.class Lcom/vkontakte/android/stickers/StickersView$TabsShower$1;
.super Ljava/lang/Object;
.source "StickersView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/StickersView$TabsShower;->toggleTabs(ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

.field final synthetic val$visible:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/StickersView$TabsShower;Z)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    .prologue
    .line 484
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower$1;->this$1:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    iput-boolean p2, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower$1;->val$visible:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 487
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower$1;->this$1:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    iget-object v1, v1, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->this$0:Lcom/vkontakte/android/stickers/StickersView;

    invoke-static {v1}, Lcom/vkontakte/android/stickers/StickersView;->access$900(Lcom/vkontakte/android/stickers/StickersView;)Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 488
    .local v0, "currentVto":Landroid/view/ViewTreeObserver;
    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 489
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 491
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower$1;->this$1:Lcom/vkontakte/android/stickers/StickersView$TabsShower;

    iget-boolean v2, p0, Lcom/vkontakte/android/stickers/StickersView$TabsShower$1;->val$visible:Z

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/stickers/StickersView$TabsShower;->access$1000(Lcom/vkontakte/android/stickers/StickersView$TabsShower;ZZ)V

    .line 492
    return v3
.end method
