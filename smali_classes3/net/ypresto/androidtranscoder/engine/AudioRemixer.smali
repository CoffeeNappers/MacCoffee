.class public interface abstract Lnet/ypresto/androidtranscoder/engine/AudioRemixer;
.super Ljava/lang/Object;
.source "AudioRemixer.java"


# static fields
.field public static final DOWNMIX:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

.field public static final PASSTHROUGH:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

.field public static final UPMIX:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 8
    new-instance v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer$1;

    invoke-direct {v0}, Lnet/ypresto/androidtranscoder/engine/AudioRemixer$1;-><init>()V

    sput-object v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->DOWNMIX:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    .line 43
    new-instance v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer$2;

    invoke-direct {v0}, Lnet/ypresto/androidtranscoder/engine/AudioRemixer$2;-><init>()V

    sput-object v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->UPMIX:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    .line 59
    new-instance v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer$3;

    invoke-direct {v0}, Lnet/ypresto/androidtranscoder/engine/AudioRemixer$3;-><init>()V

    sput-object v0, Lnet/ypresto/androidtranscoder/engine/AudioRemixer;->PASSTHROUGH:Lnet/ypresto/androidtranscoder/engine/AudioRemixer;

    return-void
.end method


# virtual methods
.method public abstract remix(Ljava/nio/ShortBuffer;Ljava/nio/ShortBuffer;)V
.end method
