.class Lcom/vk/emoji/RecentItemStore$1;
.super Ljava/lang/Object;
.source "RecentItemStore.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/emoji/RecentItemStore;->update()[Ljava/lang/String;
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
        "Lcom/vk/emoji/RecentItemStore$RecentItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/emoji/RecentItemStore;


# direct methods
.method constructor <init>(Lcom/vk/emoji/RecentItemStore;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/emoji/RecentItemStore;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vk/emoji/RecentItemStore$1;->this$0:Lcom/vk/emoji/RecentItemStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vk/emoji/RecentItemStore$RecentItem;Lcom/vk/emoji/RecentItemStore$RecentItem;)I
    .locals 2
    .param p1, "lhs"    # Lcom/vk/emoji/RecentItemStore$RecentItem;
    .param p2, "rhs"    # Lcom/vk/emoji/RecentItemStore$RecentItem;

    .prologue
    .line 72
    iget v0, p1, Lcom/vk/emoji/RecentItemStore$RecentItem;->count:F

    iget v1, p2, Lcom/vk/emoji/RecentItemStore$RecentItem;->count:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 73
    const/4 v0, 0x0

    .line 75
    :goto_0
    return v0

    :cond_0
    iget v0, p1, Lcom/vk/emoji/RecentItemStore$RecentItem;->count:F

    iget v1, p2, Lcom/vk/emoji/RecentItemStore$RecentItem;->count:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    const/4 v0, -0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 69
    check-cast p1, Lcom/vk/emoji/RecentItemStore$RecentItem;

    check-cast p2, Lcom/vk/emoji/RecentItemStore$RecentItem;

    invoke-virtual {p0, p1, p2}, Lcom/vk/emoji/RecentItemStore$1;->compare(Lcom/vk/emoji/RecentItemStore$RecentItem;Lcom/vk/emoji/RecentItemStore$RecentItem;)I

    move-result v0

    return v0
.end method
