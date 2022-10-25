.class final enum Lcom/wmspanel/libstream/BufferItem$a;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/BufferItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/BufferItem$a;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum B:Lcom/wmspanel/libstream/BufferItem$a;

.field public static final enum C:Lcom/wmspanel/libstream/BufferItem$a;

.field private static final synthetic D:[Lcom/wmspanel/libstream/BufferItem$a;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 12
    new-instance v0, Lcom/wmspanel/libstream/BufferItem$a;

    const-string/jumbo v1, "VIDEO"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/BufferItem$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/BufferItem$a;->B:Lcom/wmspanel/libstream/BufferItem$a;

    .line 13
    new-instance v0, Lcom/wmspanel/libstream/BufferItem$a;

    const-string/jumbo v1, "AUDIO"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/BufferItem$a;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/BufferItem$a;->C:Lcom/wmspanel/libstream/BufferItem$a;

    .line 11
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/wmspanel/libstream/BufferItem$a;

    sget-object v1, Lcom/wmspanel/libstream/BufferItem$a;->B:Lcom/wmspanel/libstream/BufferItem$a;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/BufferItem$a;->C:Lcom/wmspanel/libstream/BufferItem$a;

    aput-object v1, v0, v3

    sput-object v0, Lcom/wmspanel/libstream/BufferItem$a;->D:[Lcom/wmspanel/libstream/BufferItem$a;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 11
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/BufferItem$a;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 11
    const-class v0, Lcom/wmspanel/libstream/BufferItem$a;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/BufferItem$a;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/BufferItem$a;
    .locals 1

    .prologue
    .line 11
    sget-object v0, Lcom/wmspanel/libstream/BufferItem$a;->D:[Lcom/wmspanel/libstream/BufferItem$a;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/BufferItem$a;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/BufferItem$a;

    return-object v0
.end method
