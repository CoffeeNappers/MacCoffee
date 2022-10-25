.class public final enum Lcom/google/android/gms/internal/zzais$zzb;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzais;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "zzb"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/google/android/gms/internal/zzais$zzb;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum baJ:Lcom/google/android/gms/internal/zzais$zzb;

.field public static final enum baK:Lcom/google/android/gms/internal/zzais$zzb;

.field private static final synthetic baL:[Lcom/google/android/gms/internal/zzais$zzb;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/google/android/gms/internal/zzais$zzb;

    const-string/jumbo v1, "SERVER_RESET"

    invoke-direct {v0, v1, v2}, Lcom/google/android/gms/internal/zzais$zzb;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzais$zzb;->baJ:Lcom/google/android/gms/internal/zzais$zzb;

    new-instance v0, Lcom/google/android/gms/internal/zzais$zzb;

    const-string/jumbo v1, "OTHER"

    invoke-direct {v0, v1, v3}, Lcom/google/android/gms/internal/zzais$zzb;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/android/gms/internal/zzais$zzb;->baK:Lcom/google/android/gms/internal/zzais$zzb;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/google/android/gms/internal/zzais$zzb;

    sget-object v1, Lcom/google/android/gms/internal/zzais$zzb;->baJ:Lcom/google/android/gms/internal/zzais$zzb;

    aput-object v1, v0, v2

    sget-object v1, Lcom/google/android/gms/internal/zzais$zzb;->baK:Lcom/google/android/gms/internal/zzais$zzb;

    aput-object v1, v0, v3

    sput-object v0, Lcom/google/android/gms/internal/zzais$zzb;->baL:[Lcom/google/android/gms/internal/zzais$zzb;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static values()[Lcom/google/android/gms/internal/zzais$zzb;
    .locals 1

    sget-object v0, Lcom/google/android/gms/internal/zzais$zzb;->baL:[Lcom/google/android/gms/internal/zzais$zzb;

    invoke-virtual {v0}, [Lcom/google/android/gms/internal/zzais$zzb;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/android/gms/internal/zzais$zzb;

    return-object v0
.end method
