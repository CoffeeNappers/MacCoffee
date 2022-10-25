.class final enum Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;
.super Ljava/lang/Enum;
.source "ChatMessageHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ViewType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum fwdIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum fwdOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum giftIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum giftOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum messageIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum messageInText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum messageOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum messageOutText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum service:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum serviceWithoutImage:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

.field public static final enum unreadSeparator:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;


# instance fields
.field public canTextSizeChange:Z

.field public final res:I

.field public final viewTypeId:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v2, 0x0

    const/4 v9, 0x1

    .line 599
    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v1, "service"

    const v3, 0x7f030112

    const v4, 0x7f10004f

    move v5, v2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->service:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 600
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "serviceWithoutImage"

    const v6, 0x7f030113

    const v7, 0x7f100050

    move v5, v9

    move v8, v2

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->serviceWithoutImage:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 601
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "unreadSeparator"

    const v6, 0x7f03006e

    const v7, 0x7f100052

    move v5, v10

    move v8, v2

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->unreadSeparator:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 602
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "giftIn"

    const v6, 0x7f03010a

    const v7, 0x7f100049

    move v5, v11

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->giftIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 603
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "giftOut"

    const v6, 0x7f03010b

    const v7, 0x7f10004a

    move v5, v12

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->giftOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 604
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "fwdIn"

    const/4 v5, 0x5

    const v6, 0x7f03010e

    const v7, 0x7f100047

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->fwdIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 605
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "fwdOut"

    const/4 v5, 0x6

    const v6, 0x7f030111

    const v7, 0x7f100048

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->fwdOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 606
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "messageIn"

    const/4 v5, 0x7

    const v6, 0x7f03010c

    const v7, 0x7f10004b

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 607
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "messageOut"

    const/16 v5, 0x8

    const v6, 0x7f03010f

    const v7, 0x7f10004d

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 608
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "messageInText"

    const/16 v5, 0x9

    const v6, 0x7f03010d

    const v7, 0x7f10004c

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageInText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 609
    new-instance v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    const-string/jumbo v4, "messageOutText"

    const/16 v5, 0xa

    const v6, 0x7f030110

    const v7, 0x7f10004e

    move v8, v9

    invoke-direct/range {v3 .. v8}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;-><init>(Ljava/lang/String;IIIZ)V

    sput-object v3, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageOutText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    .line 598
    const/16 v0, 0xb

    new-array v0, v0, [Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    sget-object v1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->service:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->serviceWithoutImage:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v1, v0, v9

    sget-object v1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->unreadSeparator:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v1, v0, v10

    sget-object v1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->giftIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v1, v0, v11

    sget-object v1, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->giftOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v1, v0, v12

    const/4 v1, 0x5

    sget-object v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->fwdIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->fwdOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageIn:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageOut:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageInText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->messageOutText:Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->$VALUES:[Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIZ)V
    .locals 0
    .param p3, "res"    # I
    .param p4, "viewTypeId"    # I
    .param p5, "canTextSizeChange"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIZ)V"
        }
    .end annotation

    .prologue
    .line 615
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 616
    iput p3, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->res:I

    .line 617
    iput p4, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    .line 618
    iput-boolean p5, p0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->canTextSizeChange:Z

    .line 619
    return-void
.end method

.method public static getByViewTypeId(I)Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;
    .locals 5
    .param p0, "viewTypeId"    # I

    .prologue
    .line 622
    invoke-static {}, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->values()[Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_1

    aget-object v0, v2, v1

    .line 623
    .local v0, "viewType":Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;
    iget v4, v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->viewTypeId:I

    if-ne v4, p0, :cond_0

    .line 624
    return-object v0

    .line 622
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 627
    .end local v0    # "viewType":Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;
    :cond_1
    new-instance v1, Ljava/lang/RuntimeException;

    const-string/jumbo v2, "viewTypeId is incorrect"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 598
    const-class v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    return-object v0
.end method

.method public static values()[Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;
    .locals 1

    .prologue
    .line 598
    sget-object v0, Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->$VALUES:[Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    invoke-virtual {v0}, [Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/ui/holder/messages/ChatMessageHolder$ViewType;

    return-object v0
.end method
