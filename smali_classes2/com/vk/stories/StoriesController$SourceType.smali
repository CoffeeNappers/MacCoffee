.class public final enum Lcom/vk/stories/StoriesController$SourceType;
.super Ljava/lang/Enum;
.source "StoriesController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/StoriesController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "SourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/stories/StoriesController$SourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/stories/StoriesController$SourceType;

.field public static final enum LIST:Lcom/vk/stories/StoriesController$SourceType;

.field public static final enum PROFILE:Lcom/vk/stories/StoriesController$SourceType;

.field public static final enum SNIPPET:Lcom/vk/stories/StoriesController$SourceType;


# instance fields
.field private final text:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 47
    new-instance v0, Lcom/vk/stories/StoriesController$SourceType;

    const-string/jumbo v1, "LIST"

    const-string/jumbo v2, "list"

    invoke-direct {v0, v1, v3, v2}, Lcom/vk/stories/StoriesController$SourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vk/stories/StoriesController$SourceType;->LIST:Lcom/vk/stories/StoriesController$SourceType;

    new-instance v0, Lcom/vk/stories/StoriesController$SourceType;

    const-string/jumbo v1, "SNIPPET"

    const-string/jumbo v2, "snippet"

    invoke-direct {v0, v1, v4, v2}, Lcom/vk/stories/StoriesController$SourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vk/stories/StoriesController$SourceType;->SNIPPET:Lcom/vk/stories/StoriesController$SourceType;

    new-instance v0, Lcom/vk/stories/StoriesController$SourceType;

    const-string/jumbo v1, "PROFILE"

    const-string/jumbo v2, "profile"

    invoke-direct {v0, v1, v5, v2}, Lcom/vk/stories/StoriesController$SourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vk/stories/StoriesController$SourceType;->PROFILE:Lcom/vk/stories/StoriesController$SourceType;

    .line 46
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/vk/stories/StoriesController$SourceType;

    sget-object v1, Lcom/vk/stories/StoriesController$SourceType;->LIST:Lcom/vk/stories/StoriesController$SourceType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/stories/StoriesController$SourceType;->SNIPPET:Lcom/vk/stories/StoriesController$SourceType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/stories/StoriesController$SourceType;->PROFILE:Lcom/vk/stories/StoriesController$SourceType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/vk/stories/StoriesController$SourceType;->$VALUES:[Lcom/vk/stories/StoriesController$SourceType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 51
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 52
    iput-object p3, p0, Lcom/vk/stories/StoriesController$SourceType;->text:Ljava/lang/String;

    .line 53
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/stories/StoriesController$SourceType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 46
    const-class v0, Lcom/vk/stories/StoriesController$SourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/StoriesController$SourceType;

    return-object v0
.end method

.method public static values()[Lcom/vk/stories/StoriesController$SourceType;
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/vk/stories/StoriesController$SourceType;->$VALUES:[Lcom/vk/stories/StoriesController$SourceType;

    invoke-virtual {v0}, [Lcom/vk/stories/StoriesController$SourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/stories/StoriesController$SourceType;

    return-object v0
.end method


# virtual methods
.method public getText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/vk/stories/StoriesController$SourceType;->text:Ljava/lang/String;

    return-object v0
.end method
