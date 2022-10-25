.class public final Lcom/google/android/gms/internal/zzasf$zzc;
.super Lcom/google/android/gms/internal/zzaru;

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzasf;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzc"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzaru",
        "<",
        "Lcom/google/android/gms/internal/zzasf$zzc;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# instance fields
.field public bdw:Z

.field public buh:J

.field public bui:J

.field public buj:J

.field public buk:I

.field public bul:[Lcom/google/android/gms/internal/zzasf$zzd;

.field public bum:[B

.field public bun:Lcom/google/android/gms/internal/zzasf$zza;

.field public buo:[B

.field public bup:Ljava/lang/String;

.field public buq:Ljava/lang/String;

.field public bur:Ljava/lang/String;

.field public bus:J

.field public but:Lcom/google/android/gms/internal/zzasf$zzb;

.field public buu:[B

.field public buv:Ljava/lang/String;

.field public buw:I

.field public bux:[I

.field public buy:J

.field public buz:Lcom/google/android/gms/internal/zzasf$zze;

.field public tag:Ljava/lang/String;

.field public zzajo:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaru;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzasf$zzc;->cF()Lcom/google/android/gms/internal/zzasf$zzc;

    return-void
.end method


# virtual methods
.method public cF()Lcom/google/android/gms/internal/zzasf$zzc;
    .locals 6

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    const/4 v2, 0x0

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    iput v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    iput v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    iput-boolean v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    invoke-static {}, Lcom/google/android/gms/internal/zzasf$zzd;->cH()[Lcom/google/android/gms/internal/zzasf$zzd;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btY:[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    iput-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btY:[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    const-wide/32 v0, 0x2bf20

    iput-wide v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    iput-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btY:[B

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    iput v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btR:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    iput-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    iput-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    iput-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->btP:I

    return-object p0
.end method

.method public cG()Lcom/google/android/gms/internal/zzasf$zzc;
    .locals 4

    :try_start_0
    invoke-super {p0}, Lcom/google/android/gms/internal/zzaru;->cn()Lcom/google/android/gms/internal/zzaru;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzasf$zzc;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    array-length v1, v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    array-length v1, v1

    new-array v1, v1, [Lcom/google/android/gms/internal/zzasf$zzd;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    array-length v1, v1

    if-ge v2, v1, :cond_1

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    aget-object v1, v1, v2

    if-eqz v1, :cond_0

    iget-object v3, v0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzasf$zzd;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzasf$zzd;

    aput-object v1, v3, v2

    :cond_0
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzasf$zza;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzasf$zza;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    :cond_2
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzasf$zzb;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzasf$zzb;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    :cond_3
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    array-length v1, v1

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iput-object v1, v0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    :cond_4
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzasf$zze;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/android/gms/internal/zzasf$zze;

    iput-object v1, v0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    :cond_5
    return-object v0
.end method

.method public synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzasf$zzc;->cG()Lcom/google/android/gms/internal/zzasf$zzc;

    move-result-object v0

    return-object v0
.end method

.method public synthetic cn()Lcom/google/android/gms/internal/zzaru;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzasf$zzc;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzasf$zzc;

    return-object v0
.end method

.method public synthetic co()Lcom/google/android/gms/internal/zzasa;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzasf$zzc;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzasf$zzc;

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v1, 0x1

    const/4 v0, 0x0

    if-ne p1, p0, :cond_1

    move v0, v1

    :cond_0
    :goto_0
    return v0

    :cond_1
    instance-of v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;

    if-eqz v2, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzasf$zzc;

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    if-nez v2, :cond_c

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    if-nez v2, :cond_0

    :cond_2
    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    iget v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    iget v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    if-ne v2, v3, :cond_0

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    iget-boolean v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzary;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    if-nez v2, :cond_d

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    if-nez v2, :cond_0

    :cond_3
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    if-nez v2, :cond_e

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    if-nez v2, :cond_0

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    if-nez v2, :cond_f

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    if-nez v2, :cond_0

    :cond_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    if-nez v2, :cond_10

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    if-nez v2, :cond_0

    :cond_6
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    if-nez v2, :cond_11

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    if-nez v2, :cond_0

    :cond_7
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    if-nez v2, :cond_12

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    if-nez v2, :cond_0

    :cond_8
    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    iget v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzary;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    iget-wide v4, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    cmp-long v2, v2, v4

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    if-nez v2, :cond_13

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    if-nez v2, :cond_0

    :cond_9
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_a

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_14

    :cond_a
    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_b

    iget-object v2, p1, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_b
    move v0, v1

    goto/16 :goto_0

    :cond_c
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    goto/16 :goto_0

    :cond_d
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzasf$zza;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    goto/16 :goto_0

    :cond_e
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    goto/16 :goto_0

    :cond_f
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_5

    goto/16 :goto_0

    :cond_10
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    goto/16 :goto_0

    :cond_11
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzasf$zzb;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    goto/16 :goto_0

    :cond_12
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    goto/16 :goto_0

    :cond_13
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    iget-object v3, p1, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    invoke-virtual {v2, v3}, Lcom/google/android/gms/internal/zzasf$zze;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    goto/16 :goto_0

    :cond_14
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzarw;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto/16 :goto_0
.end method

.method public hashCode()I
    .locals 7

    const/16 v6, 0x20

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    if-nez v0, :cond_1

    move v0, v1

    :goto_0
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    if-eqz v0, :cond_2

    const/16 v0, 0x4cf

    :goto_1
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    invoke-static {v2}, Lcom/google/android/gms/internal/zzary;->hashCode([Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    if-nez v0, :cond_3

    move v0, v1

    :goto_2
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    if-nez v0, :cond_4

    move v0, v1

    :goto_3
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    if-nez v0, :cond_5

    move v0, v1

    :goto_4
    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    if-nez v0, :cond_6

    move v0, v1

    :goto_5
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    if-nez v0, :cond_7

    move v0, v1

    :goto_6
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    if-nez v0, :cond_8

    move v0, v1

    :goto_7
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    invoke-static {v2}, Lcom/google/android/gms/internal/zzary;->hashCode([I)I

    move-result v2

    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    ushr-long/2addr v4, v6

    xor-long/2addr v2, v4

    long-to-int v2, v2

    add-int/2addr v0, v2

    mul-int/lit8 v2, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    if-nez v0, :cond_9

    move v0, v1

    :goto_8
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_0
    :goto_9
    add-int/2addr v0, v1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto/16 :goto_0

    :cond_2
    const/16 v0, 0x4d5

    goto/16 :goto_1

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzasf$zza;->hashCode()I

    move-result v0

    goto/16 :goto_2

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_3

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_4

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_5

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzasf$zzb;->hashCode()I

    move-result v0

    goto :goto_6

    :cond_8
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_7

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzasf$zze;->hashCode()I

    move-result v0

    goto :goto_8

    :cond_a
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v1}, Lcom/google/android/gms/internal/zzarw;->hashCode()I

    move-result v1

    goto :goto_9
.end method

.method public zza(Lcom/google/android/gms/internal/zzart;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    const-wide/16 v6, 0x0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    cmp-long v0, v2, v6

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzb(IJ)V

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzq(ILjava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    array-length v0, v0

    if-lez v0, :cond_3

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    aget-object v2, v2, v0

    if-eqz v2, :cond_2

    const/4 v3, 0x3

    invoke-virtual {p1, v3, v2}, Lcom/google/android/gms/internal/zzart;->zza(ILcom/google/android/gms/internal/zzasa;)V

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    sget-object v2, Lcom/google/android/gms/internal/zzasd;->btY:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_4

    const/4 v0, 0x4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzb(I[B)V

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    sget-object v2, Lcom/google/android/gms/internal/zzasd;->btY:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_5

    const/4 v0, 0x6

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzb(I[B)V

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    const/16 v0, 0x8

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzq(ILjava/lang/String;)V

    :cond_6
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    if-eqz v0, :cond_7

    const/16 v0, 0x9

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zza(ILcom/google/android/gms/internal/zzasa;)V

    :cond_7
    iget-boolean v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    if-eqz v0, :cond_8

    const/16 v0, 0xa

    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzg(IZ)V

    :cond_8
    iget v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    if-eqz v0, :cond_9

    const/16 v0, 0xb

    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_9
    iget v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    if-eqz v0, :cond_a

    const/16 v0, 0xc

    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_a
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_b

    const/16 v0, 0xd

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzq(ILjava/lang/String;)V

    :cond_b
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c

    const/16 v0, 0xe

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzq(ILjava/lang/String;)V

    :cond_c
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    const-wide/32 v4, 0x2bf20

    cmp-long v0, v2, v4

    if-eqz v0, :cond_d

    const/16 v0, 0xf

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzd(IJ)V

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    if-eqz v0, :cond_e

    const/16 v0, 0x10

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zza(ILcom/google/android/gms/internal/zzasa;)V

    :cond_e
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    cmp-long v0, v2, v6

    if-eqz v0, :cond_f

    const/16 v0, 0x11

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzb(IJ)V

    :cond_f
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    sget-object v2, Lcom/google/android/gms/internal/zzasd;->btY:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    if-nez v0, :cond_10

    const/16 v0, 0x12

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzb(I[B)V

    :cond_10
    iget v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    if-eqz v0, :cond_11

    const/16 v0, 0x13

    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_11
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    if-eqz v0, :cond_12

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    array-length v0, v0

    if-lez v0, :cond_12

    :goto_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    array-length v0, v0

    if-ge v1, v0, :cond_12

    const/16 v0, 0x14

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    aget v2, v2, v1

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_12
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    cmp-long v0, v0, v6

    if-eqz v0, :cond_13

    const/16 v0, 0x15

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzb(IJ)V

    :cond_13
    iget-wide v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    cmp-long v0, v0, v6

    if-eqz v0, :cond_14

    const/16 v0, 0x16

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    invoke-virtual {p1, v0, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzb(IJ)V

    :cond_14
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    if-eqz v0, :cond_15

    const/16 v0, 0x17

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zza(ILcom/google/android/gms/internal/zzasa;)V

    :cond_15
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    const/16 v0, 0x18

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzq(ILjava/lang/String;)V

    :cond_16
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzaru;->zza(Lcom/google/android/gms/internal/zzart;)V

    return-void
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasa;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzasf$zzc;->zzcq(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasf$zzc;

    move-result-object v0

    return-object v0
.end method

.method public zzcq(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasf$zzc;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1, v0}, Lcom/google/android/gms/internal/zzaru;->zza(Lcom/google/android/gms/internal/zzars;I)Z

    move-result v0

    if-nez v0, :cond_0

    :sswitch_0
    return-object p0

    :sswitch_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bX()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    goto :goto_0

    :sswitch_3
    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzc(Lcom/google/android/gms/internal/zzars;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    if-nez v0, :cond_2

    move v0, v1

    :goto_1
    add-int/2addr v2, v0

    new-array v2, v2, [Lcom/google/android/gms/internal/zzasf$zzd;

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    :goto_2
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_3

    new-instance v3, Lcom/google/android/gms/internal/zzasf$zzd;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzasf$zzd;-><init>()V

    aput-object v3, v2, v0

    aget-object v3, v2, v0

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    array-length v0, v0

    goto :goto_1

    :cond_3
    new-instance v3, Lcom/google/android/gms/internal/zzasf$zzd;

    invoke-direct {v3}, Lcom/google/android/gms/internal/zzasf$zzd;-><init>()V

    aput-object v3, v2, v0

    aget-object v0, v2, v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    iput-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    goto :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    goto :goto_0

    :sswitch_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    goto :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    goto :goto_0

    :sswitch_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    if-nez v0, :cond_4

    new-instance v0, Lcom/google/android/gms/internal/zzasf$zza;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzasf$zza;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    goto :goto_0

    :sswitch_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ca()Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    goto/16 :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    goto/16 :goto_0

    :sswitch_a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    goto/16 :goto_0

    :sswitch_b
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_c
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    goto/16 :goto_0

    :sswitch_d
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->cc()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    goto/16 :goto_0

    :sswitch_e
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    if-nez v0, :cond_5

    new-instance v0, Lcom/google/android/gms/internal/zzasf$zzb;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzasf$zzb;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    :cond_5
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    goto/16 :goto_0

    :sswitch_f
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bX()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    goto/16 :goto_0

    :sswitch_10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    goto/16 :goto_0

    :sswitch_11
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iput v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    goto/16 :goto_0

    :sswitch_12
    const/16 v0, 0xa0

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzc(Lcom/google/android/gms/internal/zzars;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    if-nez v0, :cond_7

    move v0, v1

    :goto_3
    add-int/2addr v2, v0

    new-array v2, v2, [I

    if-eqz v0, :cond_6

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_6
    :goto_4
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_8

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_7
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    array-length v0, v0

    goto :goto_3

    :cond_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    goto/16 :goto_0

    :sswitch_13
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->cd()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zzagt(I)I

    move-result v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->getPosition()I

    move-result v2

    move v0, v1

    :goto_5
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ci()I

    move-result v4

    if-lez v4, :cond_9

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_9
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/zzars;->zzagv(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    if-nez v2, :cond_b

    move v2, v1

    :goto_6
    add-int/2addr v0, v2

    new-array v0, v0, [I

    if-eqz v2, :cond_a

    iget-object v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    invoke-static {v4, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_a
    :goto_7
    array-length v4, v0

    if-ge v2, v4, :cond_c

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v4

    aput v4, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_b
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    array-length v2, v2

    goto :goto_6

    :cond_c
    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzars;->zzagu(I)V

    goto/16 :goto_0

    :sswitch_14
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bX()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    goto/16 :goto_0

    :sswitch_15
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bX()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    goto/16 :goto_0

    :sswitch_16
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    if-nez v0, :cond_d

    new-instance v0, Lcom/google/android/gms/internal/zzasf$zze;

    invoke-direct {v0}, Lcom/google/android/gms/internal/zzasf$zze;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    :cond_d
    iget-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zza(Lcom/google/android/gms/internal/zzasa;)V

    goto/16 :goto_0

    :sswitch_17
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    goto/16 :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0x12 -> :sswitch_2
        0x1a -> :sswitch_3
        0x22 -> :sswitch_4
        0x32 -> :sswitch_5
        0x42 -> :sswitch_6
        0x4a -> :sswitch_7
        0x50 -> :sswitch_8
        0x58 -> :sswitch_9
        0x60 -> :sswitch_a
        0x6a -> :sswitch_b
        0x72 -> :sswitch_c
        0x78 -> :sswitch_d
        0x82 -> :sswitch_e
        0x88 -> :sswitch_f
        0x92 -> :sswitch_10
        0x98 -> :sswitch_11
        0xa0 -> :sswitch_12
        0xa2 -> :sswitch_13
        0xa8 -> :sswitch_14
        0xb0 -> :sswitch_15
        0xba -> :sswitch_16
        0xc2 -> :sswitch_17
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected zzx()I
    .locals 8

    const/4 v1, 0x0

    const-wide/16 v6, 0x0

    invoke-super {p0}, Lcom/google/android/gms/internal/zzaru;->zzx()I

    move-result v0

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    cmp-long v2, v2, v6

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buh:J

    invoke-static {v2, v4, v5}, Lcom/google/android/gms/internal/zzart;->zzf(IJ)I

    move-result v2

    add-int/2addr v0, v2

    :cond_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->tag:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzr(ILjava/lang/String;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_1
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    array-length v2, v2

    if-lez v2, :cond_4

    move v2, v0

    move v0, v1

    :goto_0
    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    array-length v3, v3

    if-ge v0, v3, :cond_3

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bul:[Lcom/google/android/gms/internal/zzasf$zzd;

    aget-object v3, v3, v0

    if-eqz v3, :cond_2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Lcom/google/android/gms/internal/zzart;->zzc(ILcom/google/android/gms/internal/zzasa;)I

    move-result v3

    add-int/2addr v2, v3

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    move v0, v2

    :cond_4
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    sget-object v3, Lcom/google/android/gms/internal/zzasd;->btY:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_5

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bum:[B

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzc(I[B)I

    move-result v2

    add-int/2addr v0, v2

    :cond_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    sget-object v3, Lcom/google/android/gms/internal/zzasd;->btY:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_6

    const/4 v2, 0x6

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buo:[B

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzc(I[B)I

    move-result v2

    add-int/2addr v0, v2

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    const/16 v2, 0x8

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bup:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzr(ILjava/lang/String;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_7
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    if-eqz v2, :cond_8

    const/16 v2, 0x9

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bun:Lcom/google/android/gms/internal/zzasf$zza;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzc(ILcom/google/android/gms/internal/zzasa;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_8
    iget-boolean v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    if-eqz v2, :cond_9

    const/16 v2, 0xa

    iget-boolean v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bdw:Z

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzh(IZ)I

    move-result v2

    add-int/2addr v0, v2

    :cond_9
    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    if-eqz v2, :cond_a

    const/16 v2, 0xb

    iget v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buk:I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v2

    add-int/2addr v0, v2

    :cond_a
    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    if-eqz v2, :cond_b

    const/16 v2, 0xc

    iget v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->zzajo:I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v2

    add-int/2addr v0, v2

    :cond_b
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    if-eqz v2, :cond_c

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_c

    const/16 v2, 0xd

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buq:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzr(ILjava/lang/String;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_c
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    if-eqz v2, :cond_d

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    const-string/jumbo v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    const/16 v2, 0xe

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bur:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzr(ILjava/lang/String;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_d
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    const-wide/32 v4, 0x2bf20

    cmp-long v2, v2, v4

    if-eqz v2, :cond_e

    const/16 v2, 0xf

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bus:J

    invoke-static {v2, v4, v5}, Lcom/google/android/gms/internal/zzart;->zzh(IJ)I

    move-result v2

    add-int/2addr v0, v2

    :cond_e
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    if-eqz v2, :cond_f

    const/16 v2, 0x10

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->but:Lcom/google/android/gms/internal/zzasf$zzb;

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzc(ILcom/google/android/gms/internal/zzasa;)I

    move-result v2

    add-int/2addr v0, v2

    :cond_f
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    cmp-long v2, v2, v6

    if-eqz v2, :cond_10

    const/16 v2, 0x11

    iget-wide v4, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bui:J

    invoke-static {v2, v4, v5}, Lcom/google/android/gms/internal/zzart;->zzf(IJ)I

    move-result v2

    add-int/2addr v0, v2

    :cond_10
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    sget-object v3, Lcom/google/android/gms/internal/zzasd;->btY:[B

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_11

    const/16 v2, 0x12

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buu:[B

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzc(I[B)I

    move-result v2

    add-int/2addr v0, v2

    :cond_11
    iget v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    if-eqz v2, :cond_12

    const/16 v2, 0x13

    iget v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buw:I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v2

    add-int/2addr v0, v2

    :cond_12
    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    if-eqz v2, :cond_14

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    array-length v2, v2

    if-lez v2, :cond_14

    move v2, v1

    :goto_1
    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    array-length v3, v3

    if-ge v1, v3, :cond_13

    iget-object v3, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    aget v3, v3, v1

    invoke-static {v3}, Lcom/google/android/gms/internal/zzart;->zzagz(I)I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_13
    add-int/2addr v0, v2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->bux:[I

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    :cond_14
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    cmp-long v1, v2, v6

    if-eqz v1, :cond_15

    const/16 v1, 0x15

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buj:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzf(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_15
    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    cmp-long v1, v2, v6

    if-eqz v1, :cond_16

    const/16 v1, 0x16

    iget-wide v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buy:J

    invoke-static {v1, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzf(IJ)I

    move-result v1

    add-int/2addr v0, v1

    :cond_16
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    if-eqz v1, :cond_17

    const/16 v1, 0x17

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buz:Lcom/google/android/gms/internal/zzasf$zze;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzc(ILcom/google/android/gms/internal/zzasa;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_17
    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    if-eqz v1, :cond_18

    iget-object v1, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    const-string/jumbo v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_18

    const/16 v1, 0x18

    iget-object v2, p0, Lcom/google/android/gms/internal/zzasf$zzc;->buv:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzr(ILjava/lang/String;)I

    move-result v1

    add-int/2addr v0, v1

    :cond_18
    return v0
.end method
