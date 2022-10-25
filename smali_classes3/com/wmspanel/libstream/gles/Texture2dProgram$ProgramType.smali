.class public final enum Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/gles/Texture2dProgram;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ProgramType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

.field public static final enum TEXTURE_2D:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

.field public static final enum TEXTURE_EXT:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

.field public static final enum TEXTURE_EXT_BW:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

.field public static final enum TEXTURE_EXT_FILT:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 35
    new-instance v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    const-string/jumbo v1, "TEXTURE_2D"

    invoke-direct {v0, v1, v2}, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_2D:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    new-instance v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    const-string/jumbo v1, "TEXTURE_EXT"

    invoke-direct {v0, v1, v3}, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_EXT:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    new-instance v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    const-string/jumbo v1, "TEXTURE_EXT_BW"

    invoke-direct {v0, v1, v4}, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_EXT_BW:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    new-instance v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    const-string/jumbo v1, "TEXTURE_EXT_FILT"

    invoke-direct {v0, v1, v5}, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_EXT_FILT:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    .line 34
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    sget-object v1, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_2D:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_EXT:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_EXT_BW:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->TEXTURE_EXT_FILT:Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->$VALUES:[Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

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
    .line 34
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 34
    const-class v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    return-object v0
.end method

.method public static values()[Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->$VALUES:[Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    invoke-virtual {v0}, [Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/wmspanel/libstream/gles/Texture2dProgram$ProgramType;

    return-object v0
.end method
