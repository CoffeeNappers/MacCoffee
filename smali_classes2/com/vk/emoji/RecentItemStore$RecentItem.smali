.class Lcom/vk/emoji/RecentItemStore$RecentItem;
.super Ljava/lang/Object;
.source "RecentItemStore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/RecentItemStore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecentItem"
.end annotation


# instance fields
.field code:Ljava/lang/String;

.field count:F

.field final synthetic this$0:Lcom/vk/emoji/RecentItemStore;


# direct methods
.method private constructor <init>(Lcom/vk/emoji/RecentItemStore;)V
    .locals 0

    .prologue
    .line 146
    iput-object p1, p0, Lcom/vk/emoji/RecentItemStore$RecentItem;->this$0:Lcom/vk/emoji/RecentItemStore;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/emoji/RecentItemStore;Lcom/vk/emoji/RecentItemStore$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/emoji/RecentItemStore;
    .param p2, "x1"    # Lcom/vk/emoji/RecentItemStore$1;

    .prologue
    .line 146
    invoke-direct {p0, p1}, Lcom/vk/emoji/RecentItemStore$RecentItem;-><init>(Lcom/vk/emoji/RecentItemStore;)V

    return-void
.end method
