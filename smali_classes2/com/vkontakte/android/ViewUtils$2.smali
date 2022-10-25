.class final Lcom/vkontakte/android/ViewUtils$2;
.super Lcom/vkontakte/android/ui/drawables/TypingDrawable;
.source "ViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ViewUtils;->getTypingText(Landroid/content/Context;ILjava/util/List;Landroid/util/SparseArray;Lcom/vkontakte/android/functions/VoidF0;I)Landroid/text/SpannableString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$f:Lcom/vkontakte/android/functions/VoidF0;


# direct methods
.method constructor <init>(ILcom/vkontakte/android/functions/VoidF0;)V
    .locals 0
    .param p1, "color"    # I

    .prologue
    .line 320
    iput-object p2, p0, Lcom/vkontakte/android/ViewUtils$2;->val$f:Lcom/vkontakte/android/functions/VoidF0;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/drawables/TypingDrawable;-><init>(I)V

    return-void
.end method


# virtual methods
.method public invalidateSelf()V
    .locals 1

    .prologue
    .line 323
    invoke-super {p0}, Lcom/vkontakte/android/ui/drawables/TypingDrawable;->invalidateSelf()V

    .line 324
    iget-object v0, p0, Lcom/vkontakte/android/ViewUtils$2;->val$f:Lcom/vkontakte/android/functions/VoidF0;

    invoke-interface {v0}, Lcom/vkontakte/android/functions/VoidF0;->f()V

    .line 325
    return-void
.end method
