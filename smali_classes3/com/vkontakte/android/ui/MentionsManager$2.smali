.class Lcom/vkontakte/android/ui/MentionsManager$2;
.super Ljava/lang/Object;
.source "MentionsManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/MentionsManager;->getAsStringWithFrm(Ljava/lang/String;)Ljava/lang/String;
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
        "Lcom/vkontakte/android/ui/MentionSpan;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/MentionsManager;

.field final synthetic val$editable:Landroid/text/Editable;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/MentionsManager;Landroid/text/Editable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/MentionsManager;

    .prologue
    .line 213
    iput-object p1, p0, Lcom/vkontakte/android/ui/MentionsManager$2;->this$0:Lcom/vkontakte/android/ui/MentionsManager;

    iput-object p2, p0, Lcom/vkontakte/android/ui/MentionsManager$2;->val$editable:Landroid/text/Editable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vkontakte/android/ui/MentionSpan;Lcom/vkontakte/android/ui/MentionSpan;)I
    .locals 2
    .param p1, "o1"    # Lcom/vkontakte/android/ui/MentionSpan;
    .param p2, "o2"    # Lcom/vkontakte/android/ui/MentionSpan;

    .prologue
    .line 216
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsManager$2;->val$editable:Landroid/text/Editable;

    invoke-interface {v0, p1}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/MentionsManager$2;->val$editable:Landroid/text/Editable;

    invoke-interface {v1, p2}, Landroid/text/Editable;->getSpanStart(Ljava/lang/Object;)I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 213
    check-cast p1, Lcom/vkontakte/android/ui/MentionSpan;

    check-cast p2, Lcom/vkontakte/android/ui/MentionSpan;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/MentionsManager$2;->compare(Lcom/vkontakte/android/ui/MentionSpan;Lcom/vkontakte/android/ui/MentionSpan;)I

    move-result v0

    return v0
.end method
