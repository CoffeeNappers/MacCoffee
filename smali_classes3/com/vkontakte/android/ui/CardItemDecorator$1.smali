.class Lcom/vkontakte/android/ui/CardItemDecorator$1;
.super Ljava/lang/Object;
.source "CardItemDecorator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/CardItemDecorator;
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
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/CardItemDecorator;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/CardItemDecorator;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/CardItemDecorator;

    .prologue
    .line 48
    iput-object p1, p0, Lcom/vkontakte/android/ui/CardItemDecorator$1;->this$0:Lcom/vkontakte/android/ui/CardItemDecorator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/view/View;Landroid/view/View;)I
    .locals 2
    .param p1, "lhs"    # Landroid/view/View;
    .param p2, "rhs"    # Landroid/view/View;

    .prologue
    .line 51
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    const/4 v0, 0x0

    .line 54
    :goto_0
    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v0

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 48
    check-cast p1, Landroid/view/View;

    check-cast p2, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/CardItemDecorator$1;->compare(Landroid/view/View;Landroid/view/View;)I

    move-result v0

    return v0
.end method
